import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my/features/cart/data/models/cart_item_model.dart';
import 'package:my/features/cart/data/models/cart_line_model.dart';
import 'package:my/features/cart/data/models/cart_model.dart';
import 'package:my/features/restaurants/data/models/dash_model.dart';
import 'package:my/features/restaurants/data/models/restaurant_model.dart';
import 'package:uuid/uuid.dart';

import 'cart_state.dart';

class CartCubit extends HydratedCubit<CartState> {
  static const Uuid _uuid = Uuid();

  CartCubit() : super(CartState.initial());

  /// Ajoute un item au panier ou met à jour la quantité s'il existe déjà
  void addItem(DashModel dash, RestaurantModel restaurant, {int quantity = 1}) {
    final currentCart = state.cart;
    final cartLines = List<CartLineModel>.from(currentCart.cartLines);

    // Trouve ou crée la ligne de panier pour ce restaurant
    final existingLineIndex = cartLines.indexWhere(
      (line) => line.restaurant.id == restaurant.id,
    );

    if (existingLineIndex != -1) {
      // Restaurant existe déjà dans le panier
      final existingLine = cartLines[existingLineIndex];
      final items = List<CartItemModel>.from(existingLine.items);

      // Vérifie si l'item existe déjà
      final existingItemIndex = items.indexWhere(
        (item) => item.dash.id == dash.id,
      );

      if (existingItemIndex != -1) {
        // Item existe, met à jour la quantité
        final existingItem = items[existingItemIndex];
        items[existingItemIndex] = existingItem.copyWith(
          quantity: existingItem.quantity + quantity,
        );
      } else {
        // Nouvel item, l'ajoute à la ligne
        items.add(
          CartItemModel(id: _uuid.v4(), dash: dash, quantity: quantity),
        );
      }

      // Met à jour la ligne de panier
      cartLines[existingLineIndex] = existingLine.copyWith(items: items);
    } else {
      // Nouveau restaurant, crée une nouvelle ligne
      cartLines.add(
        CartLineModel(
          id: _uuid.v4(),
          restaurant: restaurant,
          items: [
            CartItemModel(id: _uuid.v4(), dash: dash, quantity: quantity),
          ],
        ),
      );
    }

    // Met à jour le panier
    final updatedCart = currentCart.copyWith(
      cartLines: cartLines,
      updatedAt: DateTime.now(),
    );

    emit(state.copyWith(cart: updatedCart));
  }

  /// Supprime un item du panier
  void removeItem(String dashId, String restaurantId) {
    final currentCart = state.cart;
    final cartLines = List<CartLineModel>.from(currentCart.cartLines);

    final lineIndex = cartLines.indexWhere(
      (line) => line.restaurant.id == restaurantId,
    );

    if (lineIndex == -1) return;

    final line = cartLines[lineIndex];
    final items = List<CartItemModel>.from(line.items);

    items.removeWhere((item) => item.dash.id == dashId);

    if (items.isEmpty) {
      // Supprime la ligne entière si elle est vide
      cartLines.removeAt(lineIndex);
    } else {
      // Met à jour la ligne
      cartLines[lineIndex] = line.copyWith(items: items);
    }

    final updatedCart = currentCart.copyWith(
      cartLines: cartLines,
      updatedAt: DateTime.now(),
    );

    emit(state.copyWith(cart: updatedCart));
  }

  /// Met à jour la quantité d'un item
  void updateItemQuantity(String dashId, String restaurantId, int quantity) {
    if (quantity <= 0) {
      removeItem(dashId, restaurantId);
      return;
    }

    final currentCart = state.cart;
    final cartLines = List<CartLineModel>.from(currentCart.cartLines);

    final lineIndex = cartLines.indexWhere(
      (line) => line.restaurant.id == restaurantId,
    );

    if (lineIndex == -1) return;

    final line = cartLines[lineIndex];
    final items = List<CartItemModel>.from(line.items);

    final itemIndex = items.indexWhere((item) => item.dash.id == dashId);
    if (itemIndex == -1) return;

    items[itemIndex] = items[itemIndex].copyWith(quantity: quantity);
    cartLines[lineIndex] = line.copyWith(items: items);

    final updatedCart = currentCart.copyWith(
      cartLines: cartLines,
      updatedAt: DateTime.now(),
    );

    emit(state.copyWith(cart: updatedCart));
  }

  /// Incrémente la quantité d'un item
  void incrementItem(String dashId, String restaurantId) {
    final cartLine = state.cart.getCartLine(restaurantId);
    if (cartLine == null) return;

    final item = cartLine.getItem(dashId);
    if (item == null) return;

    updateItemQuantity(dashId, restaurantId, item.quantity + 1);
  }

  /// Décrémente la quantité d'un item
  void decrementItem(String dashId, String restaurantId) {
    final cartLine = state.cart.getCartLine(restaurantId);
    if (cartLine == null) return;

    final item = cartLine.getItem(dashId);
    if (item == null) return;

    updateItemQuantity(dashId, restaurantId, item.quantity - 1);
  }

  /// Supprime tous les items d'un restaurant
  void removeRestaurant(String restaurantId) {
    final currentCart = state.cart;
    final cartLines = List<CartLineModel>.from(currentCart.cartLines);

    cartLines.removeWhere((line) => line.restaurant.id == restaurantId);

    final updatedCart = currentCart.copyWith(
      cartLines: cartLines,
      updatedAt: DateTime.now(),
    );

    emit(state.copyWith(cart: updatedCart));
  }

  /// Vide complètement le panier
  void clearCart() {
    final clearedCart = CartModel(
      id: _uuid.v4(),
      cartLines: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    emit(state.copyWith(cart: clearedCart));
  }

  /// Obtient la quantité d'un item spécifique
  int getItemQuantity(String dashId, String restaurantId) {
    final cartLine = state.cart.getCartLine(restaurantId);
    if (cartLine == null) return 0;

    final item = cartLine.getItem(dashId);
    return item?.quantity ?? 0;
  }

  /// Vérifie si un item existe dans le panier
  bool hasItem(String dashId, String restaurantId) {
    return getItemQuantity(dashId, restaurantId) > 0;
  }

  /// Obtient le nombre total d'items dans le panier
  int get totalItems => state.cart.totalItems;

  /// Obtient le prix total du panier
  double get totalPrice => state.cart.totalPrice;

  /// Vérifie si le panier est vide
  bool get isEmpty => state.cart.isEmpty;

  /// Obtient la liste des restaurants dans le panier
  List<String> get restaurantIds => state.cart.restaurantIds;

  /// Obtient le nombre de restaurants différents dans le panier
  int get restaurantCount => state.cart.cartLines.length;

  /// Charge un panier depuis une source externe
  void loadCart(CartModel cart) {
    emit(state.copyWith(cart: cart));
  }

  // Méthodes d'hydratation pour la persistance automatique
  @override
  CartState? fromJson(Map<String, dynamic> json) {
    try {
      final cartJson = json['cart'] as Map<String, dynamic>?;
      if (cartJson == null) return CartState.initial();

      final cart = CartModel.fromJson(cartJson);
      return CartState(cart: cart);
    } catch (e) {
      // En cas d'erreur de désérialisation, retourne l'état initial
      return CartState.initial();
    }
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    try {
      return {'cart': state.cart.toJson()};
    } catch (e) {
      // En cas d'erreur de sérialisation, retourne null
      return null;
    }
  }
}
