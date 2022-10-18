import 'package:crud_training_22/services/products_service.dart';
import 'package:crud_training_22/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final productsServices = Provider.of<ProductsService>(context);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) => GestureDetector(
            child: const ProductCard(),
            onTap: () => Navigator.pushNamed(context,'product'),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}