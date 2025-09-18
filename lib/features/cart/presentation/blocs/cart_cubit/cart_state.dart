import 'package:my/features/cart/data/models/cart_model.dart';

class CartState {
  final CartModel cart;

  CartState({required this.cart});

  factory CartState.initial() {
    return CartState(
      cart: CartModel(
        id: '',
        cartLines: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
  }

  CartState copyWith({CartModel? cart, bool? isLoading, String? errorMessage}) {
    return CartState(cart: cart ?? this.cart);
  }
}
