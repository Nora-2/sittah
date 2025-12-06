
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glasses/features/orders/data/models/order_model.dart';
import 'package:glasses/features/orders/presentation/cubit/orders_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  void fetchOrders({String filter = "all"}) async {
    // Simulate API logic locally
    List<OrderModel> allOrders = mockOrders;
    List<OrderModel> filtered = [];
    
    if (filter == "all") {
      filtered = allOrders;
    } else if (filter == "unpaid") {
      filtered = []; // No unpaid mock data
    } else if (filter == "processing") {
      filtered = allOrders.where((o) => o.status == "Processing").toList();
    } else if (filter == "delivered") {
      filtered = allOrders.where((o) => o.status == "Delivered").toList();
    }
    
    emit(OrdersLoaded(filtered, selectedFilter: filter));
  }
}