import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http; 
import 'dart:convert'; 

class APICall extends StatefulWidget { 
@override 
_APICallState createState() => _APICallState(); 
} 

class _APICallState extends State<APICall> { 
final String apiUrl = 'https://uiexercise.theproindia.com/api/Product/AddProduct'; 
final TextEditingController nameController = TextEditingController(); 
final TextEditingController QuantityController = TextEditingController(); 
String result = ''; // To store the result from the API call 

@override 
void dispose() { 
	nameController.dispose(); 
	QuantityController.dispose(); 
	super.dispose(); 
} 

Future<void> _postData() async { 
	try { 
	final response = await http.post( 
		Uri.parse(apiUrl), 
		headers: <String, String>{ 
		'Content-Type': 'application/json; charset=UTF-8', 
		}, 
		body: jsonEncode(<String, dynamic>{ 
		"productName": nameController.text.toString(), 
		'quantity': int.parse(QuantityController.text),
    "isActive": true
		}), 
	); 

	if (response.statusCode == 200) { 
		// Successful POST request, handle the response here 
		final responseData = jsonDecode(response.body); 
		setState(() { 
		result = 'ID: ${responseData['id']}\nName: ${responseData['name']}\nQuantity: ${responseData['Quantity']}'; 
		}); 
	} else { 
		// If the server returns an error response, throw an exception 
		throw Exception('Failed to post data'); 
	} 
	} catch (e) { 
	setState(() { 
		result = 'Error: $e'; 
	}); 
	} 
} 

@override 
Widget build(BuildContext context) { 
	return Scaffold( 
  appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title : Text('AddProducts'),
      ),
	body: Padding( 
		padding: EdgeInsets.all(16.0), 
		child: Column( 
		mainAxisAlignment: MainAxisAlignment.center, 
		children: [ 
			TextField( 
			controller: nameController, 
			decoration: InputDecoration(labelText: 'Name'), 
			), 
			TextField( 
			controller: QuantityController, 
			decoration: InputDecoration(labelText: 'Quantity'), 
			), 
			ElevatedButton( 
			onPressed: _postData, 
			child: Text('Submit'), 
			), 
			SizedBox(height: 20.0), 
			Text( 
			result, 
			style: TextStyle(fontSize: 16.0), 
			), 
		], 
		), 
	), 
	); 
} 
} 
