import 'package:app_dev/Screens/add_product.dart';
import 'package:app_dev/Screens/appscreen.dart';
import 'package:flutter/material.dart';
 
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: ProductsScreen(),
      home: ProductListScreen(),
       routes: {
        '/Home':(context) => ProductListScreen(),
        '/Addproduct': (context) => APICall(),
       }
    );
    
  }
}