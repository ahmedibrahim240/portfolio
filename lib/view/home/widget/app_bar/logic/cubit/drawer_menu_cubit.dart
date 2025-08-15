import 'package:bloc/bloc.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/cubit/drawer_menu_state.dart';

class DrawerMenuCubit extends Cubit<DrawerMenuState> {
  DrawerMenuCubit() : super(const DrawerMenuState.initial());
  void changeDrawerState(bool isOpen) {
    if (isOpen) {
      emit(const DrawerMenuState.open());
    } else {
      emit(const DrawerMenuState.close());
    }
  }
}
