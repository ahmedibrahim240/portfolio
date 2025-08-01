import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawer_menu_state.freezed.dart';

@freezed
class DrawerMenuState<T> with _$DrawerMenuState<T> {
  const factory DrawerMenuState.initial() = _Initial;
  const factory DrawerMenuState.open() = _Open;
  const factory DrawerMenuState.close() = _Close;
}
