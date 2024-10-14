import 'package:flutter/material.dart';
import '../stores/cart_item.dart';

class ProductTile extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onRemove;

  const ProductTile({super.key, required this.cartItem, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                cartItem.product.imageUrl,
                width: 64.0,
                height: 64.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.name,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Quantidade: ${cartItem.quantity}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Preço: \$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}
