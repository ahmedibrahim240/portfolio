// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_me_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
  degree: json['degree'] as String,
  faculty: json['faculty'] as String,
  location: json['location'] as String,
  graduationDate: json['graduationDate'] as String,
);

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
  'degree': instance.degree,
  'faculty': instance.faculty,
  'location': instance.location,
  'graduationDate': instance.graduationDate,
};

ExperienceModels _$ExperienceModelsFromJson(Map<String, dynamic> json) =>
    ExperienceModels(
      title: json['title'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      period: json['period'] as String,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$ExperienceModelsToJson(ExperienceModels instance) =>
    <String, dynamic>{
      'title': instance.title,
      'company': instance.company,
      'location': instance.location,
      'period': instance.period,
      'website': instance.website,
    };

SocialLinks _$SocialLinksFromJson(Map<String, dynamic> json) => SocialLinks(
  githubUrl: json['githubUrl'] as String,
  linkedinUrl: json['linkedinUrl'] as String,
  whatsappUrl: json['whatsappUrl'] as String,
);

Map<String, dynamic> _$SocialLinksToJson(SocialLinks instance) =>
    <String, dynamic>{
      'githubUrl': instance.githubUrl,
      'linkedinUrl': instance.linkedinUrl,
      'whatsappUrl': instance.whatsappUrl,
    };

AboutHighlight _$AboutHighlightFromJson(Map<String, dynamic> json) =>
    AboutHighlight(
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$AboutHighlightToJson(AboutHighlight instance) =>
    <String, dynamic>{'title': instance.title, 'body': instance.body};

AboutMe _$AboutMeFromJson(Map<String, dynamic> json) => AboutMe(
  projects: (json['projects'] as List<dynamic>)
      .map((e) => ProjectModels.fromJson(e as Map<String, dynamic>))
      .toList(),
  fullName: json['fullName'] as String,
  image: json['image'] as String,
  cvLink: json['cvLink'] as String,
  title: json['title'] as String,
  country: json['country'] as String,
  city: json['city'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  social: SocialLinks.fromJson(json['social'] as Map<String, dynamic>),
  summary: json['summary'] as String,
  summaryHighlights: (json['summaryHighlights'] as List<dynamic>)
      .map((e) => AboutHighlight.fromJson(e as Map<String, dynamic>))
      .toList(),
  yearsOfExperience: json['yearsOfExperience'] as String,
  skills: (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
  education: (json['education'] as List<dynamic>)
      .map((e) => Education.fromJson(e as Map<String, dynamic>))
      .toList(),
  experiences: (json['experiences'] as List<dynamic>)
      .map((e) => ExperienceModels.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AboutMeToJson(AboutMe instance) => <String, dynamic>{
  'fullName': instance.fullName,
  'image': instance.image,
  'title': instance.title,
  'country': instance.country,
  'city': instance.city,
  'email': instance.email,
  'cvLink': instance.cvLink,
  'phone': instance.phone,
  'social': instance.social,
  'summary': instance.summary,
  'summaryHighlights': instance.summaryHighlights,
  'yearsOfExperience': instance.yearsOfExperience,
  'skills': instance.skills,
  'education': instance.education,
  'experiences': instance.experiences,
  'projects': instance.projects,
};

ProjectModels _$ProjectModelsFromJson(Map<String, dynamic> json) =>
    ProjectModels(
      name: json['name'] as String,
      period: json['period'] as String,
      playStoreLink: json['playStoreLink'] as String?,
      playStoreLink2: json['playStoreLink2'] as String?,
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      appStoreLink: json['appStoreLink'] as String?,
      description: json['description'] as String?,
      technologies: (json['technologies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProjectModelsToJson(ProjectModels instance) =>
    <String, dynamic>{
      'name': instance.name,
      'period': instance.period,
      'images': instance.images,
      'playStoreLink': instance.playStoreLink,
      'playStoreLink2': instance.playStoreLink2,
      'appStoreLink': instance.appStoreLink,
      'description': instance.description,
      'technologies': instance.technologies,
    };
