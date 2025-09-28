import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_state.freezed.dart';

@freezed
class OrdersState<T> with _$OrdersState<T> {
  const factory OrdersState.initial() = _Initial;
}
