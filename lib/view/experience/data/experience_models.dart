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
}

// Sample data
final List<ExperienceModels> experiencesList = [
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
];
