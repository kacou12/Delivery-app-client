import 'package:equatable/equatable.dart';
import 'package:my/features/cart/data/models/cart_line_model.dart';

class CartModel extends Equatable {
  final String id;
  final List<CartLineModel> cartLines;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CartModel({
    required this.id,
    required this.cartLines,
    required this.createdAt,
    required this.updatedAt,
  });

  CartModel copyWith({
    String? id,
    List<CartLineModel>? cartLines,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CartModel(
      id: id ?? this.id,
      cartLines: cartLines ?? List.from(this.cartLines),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  double get totalPrice =>
      cartLines.fold(0.0, (sum, line) => sum + line.totalPrice);

  int get totalItems => cartLines.fold(0, (sum, line) => sum + line.totalItems);

  bool get isEmpty =>
      cartLines.isEmpty || cartLines.every((line) => line.isEmpty);

  CartLineModel? getCartLine(String restaurantId) {
    try {
      return cartLines.firstWhere((line) => line.restaurant.id == restaurantId);
    } catch (e) {
      return null;
    }
  }

  bool hasCartLine(String restaurantId) => getCartLine(restaurantId) != null;

  List<String> get restaurantIds =>
      cartLines.map((line) => line.restaurant.id).toList();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cartLines': cartLines.map((line) => line.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] as String? ?? '',
      cartLines: (json['cartLines'] as List<dynamic>? ?? [])
          .cast<Map<String, dynamic>>()
          .map(CartLineModel.fromJson)
          .toList(),
      createdAt: DateTime.parse(
        json['createdAt'] as String? ?? DateTime.now().toIso8601String(),
      ),
      updatedAt: DateTime.parse(
        json['updatedAt'] as String? ?? DateTime.now().toIso8601String(),
      ),
    );
  }

  @override
  List<Object?> get props => [id, cartLines, createdAt, updatedAt];
}
