import 'dart:convert';
import 'package:app_dev/Screens/add_product.dart';

import '../Models/appmodel.dart';
import '../apputils.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductListScreen extends StatefulWidget {
@override
_ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
List<Product> products = [];

@override
void initState() {
	super.initState();
	fetchProducts();
}

Future<void> fetchProducts() async {
	// you can replace your api link with this link
	final response = await http.get(Uri.parse('https://uiexercise.theproindia.com/api/Product/GetAllProduct'));
	if (response.statusCode == 200) {
	List<dynamic> jsonData = json.decode(response.body);
	setState(() {
		products = jsonData.map((data) => Product.fromJson(data)).toList();
	});
	} else {
        throw Exception('Failed to load products');
	}
}

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: Text('Product List'), 
 titleTextStyle:
            const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Addproduct');
              },
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  alignment: Alignment.center,
                  textStyle: const TextStyle(fontSize: 15),
                  backgroundColor: Colors.deepOrange),
              child: const Text('Add Products'),
            ),
          )
        ],
	),
	body: ListView.builder(
		itemCount: products.length, 
		itemBuilder: (context, index) {
		return ProductCard(product: products[index]); 
		},
	),
	);
}
}

