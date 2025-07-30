import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit() : super(true);
  void updateThemeMode(bool isDarkMode) {
    emit(isDarkMode);
  }

  final String _jsonKey = 'themeMode';

  @override
  bool? fromJson(Map<String, dynamic> json) {
    final savedMode = json[_jsonKey];

    return savedMode as bool? ?? true;
  }

  @override
  Map<String, dynamic>? toJson(bool newMode) {
    return {_jsonKey: newMode};
  }
}
