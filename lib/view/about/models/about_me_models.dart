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
}

class SocialLinks {
  final String githubUrl;
  final String linkedinUrl;
  final String whatsappUrl;

  const SocialLinks({
    required this.githubUrl,
    required this.linkedinUrl,
    required this.whatsappUrl,
  });
}

class Skill {
  final String name;
  final String? imageAsset; // e.g., assets/icons/flutter.png
  final String? imageUrl; // optional network icon URL

  const Skill({required this.name, this.imageAsset, this.imageUrl});
}

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
  final List<Skill> skills;
  final List<Education> education;

  const AboutMe({
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
  });
}

// Constant instance populated with the provided data
const AboutMe kAboutMe = AboutMe(
  fullName: 'Ahmed Ibrahim',
  image: 'assets/me.jpeg',
  title: 'Sr. Flutter Developer',
  country: 'Egypt',
  city: 'Al Mansoura',
  email: 'ahmedibrahim150240@gmail.com',
  phone: '+201019507730',
  social: SocialLinks(
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
  skills: <Skill>[
    // Brand icons via Simple Icons CDN
    Skill(
      name: 'Flutter',
      imageUrl: 'https://cdn.jsdelivr.net/npm/simple-icons/icons/flutter.svg',
    ),
    Skill(
      name: 'Dart',
      imageUrl: 'https://cdn.jsdelivr.net/npm/simple-icons/icons/dart.svg',
    ),
    Skill(
      name: 'Firebase',
      imageUrl: 'https://cdn.jsdelivr.net/npm/simple-icons/icons/firebase.svg',
    ),
    Skill(
      name: 'Google Maps',
      imageUrl: 'https://cdn.jsdelivr.net/npm/simple-icons/icons/googlemaps.svg',
    ),

    // Conceptual icons via Tabler Icons
    Skill(
      name: 'Algorithms',
      imageUrl:
          'https://raw.githubusercontent.com/tabler/tabler-icons/master/icons/binary.svg',
    ),
    Skill(
      name: 'OOP',
      imageUrl:
          'https://raw.githubusercontent.com/tabler/tabler-icons/master/icons/hierarchy-3.svg',
    ),
    Skill(
      name: 'Data Structures',
      imageUrl:
          'https://raw.githubusercontent.com/tabler/tabler-icons/master/icons/tree.svg',
    ),
    Skill(
      name: 'Databases',
      imageUrl:
          'https://raw.githubusercontent.com/tabler/tabler-icons/master/icons/database.svg',
    ),
    Skill(
      name: 'State Management',
      imageUrl:
          'https://raw.githubusercontent.com/tabler/tabler-icons/master/icons/git-branch.svg',
    ),
    Skill(
      name: 'GetX',
      imageUrl:
          'https://raw.githubusercontent.com/tabler/tabler-icons/master/icons/bolt.svg',
    ),
    Skill(
      name: 'BLoC',
      imageUrl:
          'https://raw.githubusercontent.com/tabler/tabler-icons/master/icons/puzzle.svg',
    ),
    Skill(
      name: 'REST API',
      imageUrl:
          'https://raw.githubusercontent.com/tabler/tabler-icons/master/icons/api.svg',
    ),
  ],
  education: <Education>[
    Education(
      degree: "Bachelor's Degree in Statistics And Computer Science",
      faculty: 'Faculty of Science',
      location: 'Mansoura, Egypt',
      graduationDate: '10/2020',
    ),
  ],
);
