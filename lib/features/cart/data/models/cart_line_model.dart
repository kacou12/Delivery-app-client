import 'package:equatable/equatable.dart';
import 'package:my/features/cart/data/models/cart_item_model.dart';
import 'package:my/features/restaurants/data/models/restaurant_model.dart';

class CartLineModel extends Equatable {
  final String id;
  final RestaurantModel restaurant;
  final List<CartItemModel> items;

  const CartLineModel({
    required this.id,
    required this.restaurant,
    required this.items,
  });

  CartLineModel copyWith({
    String? id,
    RestaurantModel? restaurant,
    List<CartItemModel>? items,
  }) {
    return CartLineModel(
      id: id ?? this.id,
      restaurant: restaurant ?? this.restaurant,
      items: items ?? List.from(this.items),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'restaurant': restaurant.toJson(),
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory CartLineModel.fromJson(Map<String, dynamic> json) {
    return CartLineModel(
      id: json['id'] as String? ?? '',
      restaurant: RestaurantModel.fromJson(json['restaurant']),
      items: (json['items'] as List<dynamic>? ?? [])
          .cast<Map<String, dynamic>>()
          .map(CartItemModel.fromJson)
          .toList(),
    );
  }

  double get totalPrice =>
      items.fold(0.0, (sum, item) => sum + item.totalPrice);

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  bool get isEmpty => items.isEmpty;

  CartItemModel? getItem(String dashId) {
    try {
      return items.firstWhere((item) => item.dash.id == dashId);
    } catch (e) {
      return null;
    }
  }

  bool hasItem(String dashId) => getItem(dashId) != null;

  @override
  List<Object?> get props => [id, restaurant, items];
}
