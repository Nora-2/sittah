
// State Management
import 'package:equatable/equatable.dart';
import 'package:glasses/features/orders/data/models/order_model.dart';

abstract class OrderState extends Equatable {
  @override
  List<Object> get props => [];
}
class OrderInitial extends OrderState {}
class OrderLoading extends OrderState {}
class OrdersLoaded extends OrderState {
  final List<OrderModel> orders;
  final String selectedFilter;
  OrdersLoaded(this.orders, {this.selectedFilter = "all"});
  @override
  List<Object> get props => [orders, selectedFilter];
}
