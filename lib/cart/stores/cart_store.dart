import 'package:mobx/mobx.dart';
import 'cart_item.dart';
import '../models/product.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  @observable
  ObservableList<CartItem> items = ObservableList<CartItem>();

  @action
  void addProduct(Product product) {
    final existingItem = items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      items.add(CartItem(product: product, quantity: 1));
    } else {
      existingItem.increment();
    }
  }

  @action
  void removeProduct(Product product) {
    items.removeWhere((item) => item.product.id == product.id);
  }

  @computed
  double get total {
    return items.fold(0, (sum, item) => sum + item.product.price * item.quantity);
  }
}
