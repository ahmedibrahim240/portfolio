import 'package:freezed_annotation/freezed_annotation.dart';

part 'scroll_cubit_state.freezed.dart';

@freezed
class ScrollCubitState with _$ScrollCubitState {
  const factory ScrollCubitState.initial() = _Initial;
  const factory ScrollCubitState.scrollToSection({required String sctionPath}) =
      _ScrollToSection;
}
