import 'package:get_it/get_it.dart';
import 'package:my_portfolio/core/themes/cubit/theme_cubit.dart';
import 'package:my_portfolio/view/app_bar/logic/cubit/drawer_menu_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  getIt.registerLazySingleton<DrawerMenuCubit>(() => DrawerMenuCubit());
}
