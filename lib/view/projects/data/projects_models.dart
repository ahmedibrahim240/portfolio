class ProjectModels {
  final String name;
  final String period;
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
    this.appStoreLink,
    this.description,
    required this.technologies,
  });
}

// List of all projects across all experiences
final List<ProjectModels> allProjects = [
  // Tayaar
  ProjectModels(
    name: 'Tayaar',
    period: '04/2025 - Present',
    playStoreLink: 'TAYAAR',
    appStoreLink: 'TAYAAR',
    description:
        'An intelligent Delivery management system designed specifically for Salla platform merchants',
    technologies: [
      'State Management: Bloc',
      'Firebase Push Notification',
      'Firebase CLI',
      'Google Maps',
      'Biometric Login',
      "flavors",
    ],
  ),
  // Try GC
  ProjectModels(
    name: 'Try GC',
    period: '07/2023 - 07/2024',
    playStoreLink: 'Try GC',
    appStoreLink: 'Try GC',
    description: 'Two apps in one app switching between them by user type after login',
    technologies: [
      'State Management: GetX',
      'Firebase Push Notification',
      'Firebase CLI',
      'Google Maps integration',
      'Location services',
      "flavors",
    ],
  ),
  // Elite App
  ProjectModels(
    name: 'Elite App',
    period: '10/2024 - Present',
    playStoreLink: 'ELITE',
    appStoreLink: 'ELITE',
    description: 'Two apps in one app switching between them by user type after login',

    technologies: [
      'State Management: GetX',
      'Firebase Push Notification',
      'Firebase CLI',
      'Google Maps integration',
      'Location services',
      "flavors",
    ],
  ),
  // iKhair for Donation
  ProjectModels(
    name: 'iKhair for Donation',
    period: '03/2022 - 05/2023',
    playStoreLink:
        'https://play.google.com/store/apps/details?id=com.quantatil.ikhar&pli=1',
    appStoreLink: 'https://apps.apple.com/us/app/ikhair-for-donation/id542915812',
    description:
        'The first donation app in UAE. Developed for paying zakat and making donations via SMS, Credit card, and Bank account. Raised more than 13 million durham for over 150 charitable projects and urgent cases.',
    technologies: [
      'State Management: GetX',
      'Firebase Push Notifications',
      'Firebase Social Media Login',
      'Local Notifications for prayer times and campaigns',
      'Native Deep Linking',
      "flavors",
    ],
  ),
  // Tyasart
  ProjectModels(
    name: 'Tyasart',
    period: '03/2024 - 06/2024',
    playStoreLink:
        'https://play.google.com/store/apps/details?id=com.briefcode.tyasartclient',
    appStoreLink:
        'https://play.google.com/store/apps/details?id=com.briefcode.tyasartaccompanying',
    description:
        'An app to help disabled people with two separate apps in one (client and companion)',
    technologies: [
      'State Management: GetX',
      'Payment Integration',
      'Live Chat between Client and Companion',
      'Real-time Location Tracking with Google Maps',
      'Firebase Push Notifications',
      "flavors",
    ],
  ),
];
