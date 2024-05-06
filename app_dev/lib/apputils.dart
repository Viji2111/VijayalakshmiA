
import 'package:flutter/material.dart';
import 'Models/appmodel.dart';

class ProductCard extends StatelessWidget {
final Product product;

ProductCard({required this.product});

@override
Widget build(BuildContext context) {
	return Card(
	child: Padding(
		padding: const EdgeInsets.all(8.0),
		child: Column( // this is the coloumn
		children: [
			ListTile(
			title: Text(product.ProductName),
			subtitle: Text('${product.Quantity} '), // this is fetch the price from the api
			trailing: Row(
				mainAxisSize: MainAxisSize.min,
				children: [
				Icon(Icons.star, color: Colors.orange),// this will give the rating
				Text('${product.IsActive}'),
				],
			),
			),
		],
		),
	),
	);
}
}


