import 'package:mobx/mobx.dart';
import '../models/product.dart';

part 'cart_item.g.dart';

class CartItem = _CartItemBase with _$CartItem;

abstract class _CartItemBase with Store {
  final Product product;
  @observable
  int quantity;

  _CartItemBase({
    required this.product,
    this.quantity = 1,
  });

  @action
  void increment() {
    quantity++;
  }

  @action
  void decrement() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
