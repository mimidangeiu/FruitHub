import 'package:ex2/core/models/cart_item.dart';
import 'package:ex2/module/cart/cubit/cart_state.dart' show CartState;
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState(items: [], total: 0));

  double calculateTotal(List<CartItem> items) {
    return items.fold(
      0.0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  void addItem(CartItem item) {
    final updatedItems = [...state.items];
    final index = updatedItems.indexWhere(
      (e) => e.product.name == item.product.name,
    );
    if (index == -1) {
      updatedItems.add(item);
    } else {
      updatedItems[index] = updatedItems[index].copyWith(
        quantity: updatedItems[index].quantity + item.quantity,
      );
    }
    final updatedTotal = calculateTotal(updatedItems);
    emit(state.copyWith(items: updatedItems, total: updatedTotal));
  }

  void increase(CartItem item) {
    final updatedItems = [...state.items];
    final index = updatedItems.indexWhere(
      (e) => e.product.name == item.product.name,
    );
    if (index == -1) {
      return;
    }
    updatedItems[index] = updatedItems[index].copyWith(
      quantity: updatedItems[index].quantity + 1,
    );
    final updatedTotal = calculateTotal(updatedItems);
    emit(state.copyWith(items: updatedItems, total: updatedTotal));
  }

  void remove(CartItem item) {
    final updatedItems = [...state.items];
    final index = updatedItems.indexWhere(
      (e) => e.product.name == item.product.name,
    );
    if (index == -1) {
      return;
    }
    updatedItems.removeAt(index);
    final updatedTotal = calculateTotal(updatedItems);
    emit(state.copyWith(items: updatedItems, total: updatedTotal));
  }

  void decrease(CartItem item) {
    final updatedItems = [...state.items];
    final index = updatedItems.indexWhere(
      (e) => e.product.name == item.product.name,
    );
    if (index == -1) {
      return;
    }
    if (updatedItems[index].quantity > 1) {
      updatedItems[index] = updatedItems[index].copyWith(
        quantity: updatedItems[index].quantity - 1,
      );
      final updatedTotal = calculateTotal(updatedItems);
      emit(state.copyWith(items: updatedItems, total: updatedTotal));
    } else {
      remove(item);
    }
  }

  void clear() {
    emit(const CartState(items: [], total: 0));
  }
}
