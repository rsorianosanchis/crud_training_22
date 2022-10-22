import 'package:crud_training_22/models/product_model.dart';
import 'package:crud_training_22/screens/screens.dart';
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
    final List<ProductModel> listProducts = productsServices.productList;

    if(productsServices.isLoading) return const LoadingScreen();

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: productsServices.productList.length,
        itemBuilder: ((context, index) => GestureDetector(
            child: ProductCard(product: listProducts[index]),
            //onTap: () => Navigator.pushNamed(context,'product',arguments: listProducts[index]),
            onTap: () {
              productsServices.selectedProduct=listProducts[index].copyProduct();//rompemos la referencia al ahcer una copia. Asi no cargaremos en la pantalla de detail el que esta refrenciado en la Lista sino uno nuevo que es igual
              Navigator.pushNamed(context,'product');
            },
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