import 'package:flutter/material.dart';
import 'package:mobx_study/cart/stores/cart_store.dart';
import 'package:mobx_study/cart/ui/cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CartStore cartStore = CartStore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrinho de Compras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartPage(cartStore: cartStore),
    );
  }
}
