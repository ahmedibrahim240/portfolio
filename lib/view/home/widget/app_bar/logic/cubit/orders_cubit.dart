import 'package:bloc/bloc.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/cubit/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(const OrdersState.initial());
}
