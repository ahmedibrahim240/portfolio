// One-off uploader: pushes the local `kAboutMe` data to Firestore via the REST
// API, mirroring FirebaseAboutMeService.uploadStructuredAboutMeData() plus a
// cleanup pass that removes documents left over from a previous, longer list.
//
// Run with: dart run tool/upload_about_me.dart
import 'dart:convert';
import 'dart:io';

import 'package:my_portfolio/view/about/models/about_me_models.dart';

const _projectId = 'my-portfolio-47aa7';
const _root =
    'https://firestore.googleapis.com/v1/projects/$_projectId/databases/(default)/documents';
const _aboutMe = '$_root/portfolio/about_me';

Map<String, dynamic> _value(dynamic v) {
  if (v == null) return {'nullValue': null};
  if (v is String) return {'stringValue': v};
  if (v is bool) return {'booleanValue': v};
  if (v is int) return {'integerValue': '$v'};
  if (v is double) return {'doubleValue': v};
  if (v is List) {
    return {
      'arrayValue': {'values': v.map(_value).toList()},
    };
  }
  if (v is Map) {
    return {
      'mapValue': {'fields': _fields(v.cast<String, dynamic>())},
    };
  }
  throw ArgumentError('Unsupported value: $v');
}

Map<String, dynamic> _fields(Map<String, dynamic> json) =>
    json.map((k, v) => MapEntry(k, _value(v)));

Future<String> _send(String method, String url, [Map<String, dynamic>? body]) async {
  final client = HttpClient();
  try {
    final request = await client.openUrl(method, Uri.parse(url));
    if (body != null) {
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(body));
    }
    final response = await request.close();
    final text = await response.transform(utf8.decoder).join();
    if (response.statusCode >= 300) {
      throw HttpException('$method $url -> ${response.statusCode}\n$text');
    }
    return text;
  } finally {
    client.close();
  }
}

/// The generated `toJson()` leaves nested models as objects; a JSON round-trip
/// (which calls their `toJson()` in turn) flattens them to plain maps.
Map<String, dynamic> _plain(Map<String, dynamic> json) =>
    jsonDecode(jsonEncode(json)) as Map<String, dynamic>;

Future<void> _setDoc(String path, Map<String, dynamic> json) =>
    _send('PATCH', path, {'fields': _fields(_plain(json))});

Future<List<String>> _docIds(String collection) async {
  final text = await _send(
    'GET',
    '$collection?mask.fieldPaths=__name__&pageSize=300',
  );
  final documents = (jsonDecode(text) as Map<String, dynamic>)['documents'] as List?;
  return documents == null
      ? <String>[]
      : documents
            .map((d) => (d as Map<String, dynamic>)['name'] as String)
            .map((n) => n.split('/').last)
            .toList();
}

/// Writes [items] as `<prefix>_<index>` docs and deletes any stale doc left in
/// the collection from an earlier, longer upload.
Future<void> _syncCollection(
  String name,
  String prefix,
  List<Map<String, dynamic>> items,
) async {
  final collection = '$_aboutMe/$name';
  final existing = await _docIds(collection);
  final written = <String>[];

  for (var i = 0; i < items.length; i++) {
    final id = '${prefix}_$i';
    await _setDoc('$collection/$id', items[i]);
    written.add(id);
  }
  for (final id in existing.where((id) => !written.contains(id))) {
    await _send('DELETE', '$collection/$id');
    stdout.writeln('  deleted stale $name/$id');
  }
  stdout.writeln('  $name: ${items.length} docs written');
}

Future<void> main() async {
  final json = kAboutMe.toJson()
    ..remove('education')
    ..remove('experiences')
    ..remove('projects');

  await _setDoc(_aboutMe, json);
  stdout.writeln('portfolio/about_me updated');

  await _syncCollection(
    'education',
    'edu',
    kAboutMe.education.map((e) => e.toJson()).toList(),
  );
  await _syncCollection(
    'experience',
    'exp',
    kAboutMe.experiences.map((e) => e.toJson()).toList(),
  );
  await _syncCollection(
    'projects',
    'project',
    kAboutMe.projects.map((e) => e.toJson()).toList(),
  );

  stdout.writeln('Done.');
}
