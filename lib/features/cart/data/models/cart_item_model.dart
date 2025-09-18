import 'package:equatable/equatable.dart';
import 'package:my/features/restaurants/data/models/dash_model.dart';

class CartItemModel extends Equatable {
  final String id;
  final DashModel dash;
  final int quantity;

  const CartItemModel({
    required this.id,
    required this.dash,
    required this.quantity,
  });

  CartItemModel copyWith({String? id, DashModel? dash, int? quantity}) {
    return CartItemModel(
      id: id ?? this.id,
      dash: dash ?? this.dash,
      quantity: quantity ?? this.quantity,
    );
  }

  int get totalPrice => dash.price * quantity;

  Map<String, dynamic> toJson() {
    return {'id': id, 'dash': dash.toJson(), 'quantity': quantity};
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] as String? ?? '',
      dash: DashModel.fromJson(json),
      quantity: json['quantity'] as int? ?? 0,
    );
  }

  @override
  List<Object?> get props => [id, dash, quantity];
}
