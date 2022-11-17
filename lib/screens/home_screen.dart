import 'dart:io';

import 'package:flutter/material.dart';
import 'package:crud_training_22/models/models.dart';
import 'package:crud_training_22/screens/screens.dart';
import 'package:crud_training_22/services/services.dart';
import 'package:crud_training_22/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final productsServices = Provider.of<ProductsService>(context);
    final List<ProductModel> listProducts = productsServices.productList;
    final authService = Provider.of<AuthService>(context, listen: false);// no necesito estar escuchandolo porque solo uso este provaider para acceder a un metodo cuando me interresa

    if(productsServices.isLoading) return const LoadingScreen();

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          
          IconButton(
            onPressed: (){
              authService.logOut();
              //exit(0);
              Navigator.pushReplacementNamed(context, 'login');
            }, 
            icon:const Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: ListView.builder(
        itemCount: productsServices.productList.length,
        itemBuilder: ((context, index) => GestureDetector(
            child: ProductCard(product: listProducts[index]),
            //onTap: () => Navigator.pushNamed(context,'product',arguments: listProducts[index]),
            onTap: () {
              //cargamos al selectedproduct del provider una copia para romper la referencia y no se modifique el original.
              // y luego ya usaremops el selected en la pagina que nos interese a traves del provider
              productsServices.selectedProduct=listProducts[index].copyProduct();//rompemos la referencia al ahcer una copia. Asi no cargaremos en la pantalla de detail el que esta refrenciado en la Lista sino uno nuevo que es igual
              Navigator.pushNamed(context,'product');
            },
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          productsServices.selectedProduct = ProductModel(available: false, name: '', price: 0);
          Navigator.pushNamed(context, 'product');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}