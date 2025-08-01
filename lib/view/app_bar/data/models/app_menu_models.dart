import 'package:my_portfolio/core/routing/routes.dart';

class AppMenuModel {
  final String title, path;
  final int index;

  AppMenuModel({required this.title, required this.index, required this.path});
  static List<AppMenuModel> menuList = [
    AppMenuModel(title: 'Experiences', index: 0, path: AppRoutes.experiences),
    AppMenuModel(title: 'Skills', index: 1, path: AppRoutes.skills),
    AppMenuModel(title: 'Projects', index: 2, path: AppRoutes.projects),
    AppMenuModel(title: 'About Me', index: 3, path: AppRoutes.about),
    AppMenuModel(title: 'Contact Me', index: 4, path: AppRoutes.contact),
  ];
}
