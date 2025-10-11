import 'package:json_annotation/json_annotation.dart';
import 'package:my_portfolio/core/helper/image_assets_path.dart';

part 'about_me_models.g.dart';

@JsonSerializable()
class Education {
  final String degree;
  final String faculty;
  final String location;
  final String graduationDate; // e.g., MM/YYYY or YYYY

  const Education({
    required this.degree,
    required this.faculty,
    required this.location,
    required this.graduationDate,
  });

  factory Education.fromJson(Map<String, dynamic> json) => _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}

@JsonSerializable()
class ExperienceModels {
  final String title;
  final String company;
  final String location;
  final String period;
  final String? website;

  ExperienceModels({
    required this.title,
    required this.company,
    required this.location,
    required this.period,
    this.website,
  });

  factory ExperienceModels.fromJson(Map<String, dynamic> json) =>
      _$ExperienceModelsFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceModelsToJson(this);
}

@JsonSerializable()
class SocialLinks {
  final String githubUrl;
  final String linkedinUrl;
  final String whatsappUrl;

  const SocialLinks({
    required this.githubUrl,
    required this.linkedinUrl,
    required this.whatsappUrl,
  });

  factory SocialLinks.fromJson(Map<String, dynamic> json) => _$SocialLinksFromJson(json);

  Map<String, dynamic> toJson() => _$SocialLinksToJson(this);
}

@JsonSerializable()
class AboutMe {
  final String fullName;
  final String image;
  final String title; // e.g., Sr. Flutter Developer
  final String country;
  final String city;
  final String email;
  final String phone;
  final SocialLinks social;
  final String summary;
  final String yearsOfExperience;
  final List<String> skills;
  final List<Education> education;
  final List<ExperienceModels> experiences;
  final List<ProjectModels> projects;

  const AboutMe({
    required this.projects,
    required this.fullName,
    required this.image,
    required this.title,
    required this.country,
    required this.city,
    required this.email,
    required this.phone,
    required this.social,
    required this.summary,
    required this.yearsOfExperience,
    required this.skills,
    required this.education,
    required this.experiences,
  });

  factory AboutMe.fromJson(Map<String, dynamic> json) => _$AboutMeFromJson(json);

  Map<String, dynamic> toJson() => _$AboutMeToJson(this);
}

@JsonSerializable()
class ProjectModels {
  final String name;
  final String period;
  final List<String> images;
  final String? playStoreLink;
  final String? playStoreLink2;
  final String? appStoreLink;
  final String? description;
  final List<String> technologies;

  ProjectModels({
    required this.name,
    required this.period,
    this.playStoreLink,
    this.playStoreLink2,
    this.images = const [],
    this.appStoreLink,
    this.description,
    required this.technologies,
  });
  factory ProjectModels.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelsFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelsToJson(this);
}

// List of all projects across all experiences
final List<ProjectModels> allProjects = [
  // Tayaar
  ProjectModels(
    name: 'Tayaar',
    period: '04/2025 - Present',
    images: AssetsImagePath.getTayaarImages,
    playStoreLink: 'TAYAAR',
    appStoreLink: 'TAYAAR',
    description:
        'An intelligent Delivery management system designed specifically for Salla platform merchants',
    technologies: [
      'REST API',
      "flavors",
      'Google Maps',
      'Firebase CLI',
      'Biometric Login',
      'State Management: Bloc',
      'Firebase Push Notification',
    ],
  ),
  // Try GC
  ProjectModels(
    name: 'Try GC',
    period: '07/2023 - 07/2024',
    images: AssetsImagePath.getTrygcImages,

    playStoreLink: 'Try GC',
    appStoreLink: 'Try GC',
    description: 'Two apps in one app switching between them by user type after login',
    technologies: [
      'REST API',
      "flavors",
      'Firebase CLI',
      'Location services',
      'State Management: GetX',
      'Google Maps integration',
      'Firebase Push Notification',
    ],
  ),
  // Elite App
  ProjectModels(
    name: 'Elite App',
    images: AssetsImagePath.getEliteImages,

    period: '10/2024 - Present',
    playStoreLink: 'ELITE',
    appStoreLink: 'ELITE',
    description: 'Two apps in one app switching between them by user type after login',

    technologies: [
      'REST API',
      "flavors",
      'Firebase CLI',
      'Location services',
      'State Management: GetX',
      'Google Maps integration',
      'Firebase Push Notification',
    ],
  ),
  // iKhair for Donation
  ProjectModels(
    name: 'iKhair for Donation',
    period: '03/2022 - 05/2023',
    images: AssetsImagePath.getIkharImages,
    playStoreLink:
        'https://play.google.com/store/apps/details?id=com.quantatil.ikhar&pli=1',
    appStoreLink: 'https://apps.apple.com/us/app/ikhair-for-donation/id542915812',
    description:
        'The first donation app in UAE. Developed for paying zakat and making donations via SMS, Credit card, and Bank account. Raised more than 13 million durham for over 150 charitable projects and urgent cases.',
    technologies: [
      'REST API',
      "flavors",
      'Native Deep Linking',
      'State Management: GetX',
      'Firebase Social Media Login',
      'Firebase Push Notifications',
      'Local Notifications for prayer times and campaigns',
    ],
  ),
  // Tyasart
  ProjectModels(
    name: 'Tyasart Client',
    period: '03/2024 - 06/2024',
    images: AssetsImagePath.getTyasartClinetImages,

    playStoreLink:
        'https://play.google.com/store/apps/details?id=com.briefcode.tyasartclient',
    description:
        'App in test mode \n  An app to help disabled people with two separate apps in one (client and companion)',
    technologies: [
      'REST API',
      "flavors",
      'Payment Integration',
      'State Management: GetX',
      'Firebase Push Notifications',
      'Live Chat between Client and Companion',
      'Real-time Location Tracking with Google Maps',
    ],
  ),
  // Tyasart
  ProjectModels(
    name: 'Tyasart Accompanying',
    period: '03/2024 - 06/2024',
    images: AssetsImagePath.getTyasartComImages,
    playStoreLink:
        'https://play.google.com/store/apps/details?id=com.briefcode.tyasartaccompanying',
    description:
        'App in test mode \n An app to help disabled people with two separate apps in one (client and companion)',
    technologies: [
      'REST API',
      "flavors",
      'Payment Integration',
      'State Management: GetX',
      'Firebase Push Notifications',
      'Live Chat between Client and Companion',
      'Real-time Location Tracking with Google Maps',
    ],
  ),
];

// Constant instance populated with the provided data
AboutMe kAboutMe = AboutMe(
  fullName: 'Ahmed Ibrahim',
  image: 'assets/me.jpeg',
  title: 'Sr. Flutter Developer',
  country: 'Egypt',
  city: 'Al Mansoura',
  email: 'ahmedibrahim150240@gmail.com',
  phone: '+201019507730',
  projects: allProjects,
  social: const SocialLinks(
    githubUrl: 'https://github.com/ahmedibrahim240',
    linkedinUrl: 'https://www.linkedin.com/in/ahmed-ibrahim-6895a2205/',
    whatsappUrl: 'https://wa.me//+201551016887',
  ),
  summary:
      'Sr. Flutter Developer with 5+ years building high-quality Android and iOS apps. '
      'Strong in clean architecture and state management (GetX/BLoC), integrating REST APIs, '
      'Firebase, and Google Maps to ship scalable, maintainable features. '
      'Clear communicator focused on UX, performance, and on-time delivery.',
  yearsOfExperience: '5+',
  skills: <String>[
    'Flutter',
    'Dart',
    'Firebase',
    'Google Maps',
    'Algorithms',
    'OOP',
    'Data Structures',
    'Databases',
    'State Management',
    'GetX',
    'BLoC',
    'REST API',
  ],
  education: <Education>[
    const Education(
      degree: "Bachelor's Degree in Statistics And Computer Science",
      faculty: 'Faculty of Science',
      location: 'Mansoura, Egypt',
      graduationDate: '10/2020',
    ),
  ],
  experiences: [
    ExperienceModels(
      title: 'Flutter Developer (part-time)',
      company: 'Beta Lab IT (LLC)',
      location: 'Saudi Arabia',
      period: '04/2025 - Present',
      website: 'https://dev.trytayaar.com/',
    ),
    ExperienceModels(
      title: 'Flutter Developer',
      company: 'Grand Community',
      location: 'Mansoura, Egypt',
      period: '07/2023 - Present',
      website: 'https://grand-community.com/en',
    ),
    ExperienceModels(
      title: 'Flutter Developer',
      company: 'Appgain.io',
      location: 'Eldoky, Egypt',
      period: '03/2022 - 07/2023',
      website: 'https://www.appgain.io/',
    ),
  ],
);
