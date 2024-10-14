import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/cart_store.dart';
import 'product_tile.dart';
import '../models/product.dart';

class CartPage extends StatelessWidget {
  final CartStore cartStore;

  const CartPage({Key? key, required this.cartStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de Compras'),
      ),
      body: Observer(
        builder: (context) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartStore.items.length,
                  itemBuilder: (context, index) {
                    return ProductTile(
                      cartItem: cartStore.items[index],
                      onRemove: () {
                        cartStore.removeProduct(cartStore.items[index].product);
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: \$${cartStore.total.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cartStore.addProduct(Product(id: '1', productName: 'Produto 1', price: 10.0, imageUrl: 'https://via.placeholder.com/150', name: 'Juliete Oakley'));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
