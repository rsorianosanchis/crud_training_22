import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crud_training_22/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _urlBase = 'flutter-training-8f59b-default-rtdb.europe-west1.firebasedatabase.app';
  //final String _urlBase = 'https://flutter-training-8f59b-default-rtdb.europe-west1.firebasedatabase.app/products.json';
  final List<ProductModel> productList = [];
  // este es el product que usamos para pasar datos cuando clikamos sobre la lista uno en concreto. Por cambiar
  // de metodo y no usar los arguments de navoigator
  late ProductModel selectedProduct;

  bool isLoading = true;

  ProductsService(){
    loadProducts();
  }

  //TODO: return <List<ProductModel>>
  Future <List<ProductModel>> loadProducts()async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_urlBase,'products.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {

      final Map<String,dynamic> dataMapResp = jsonDecode(response.body);
      // En este caso la String del map es el ID (ABC123) de cada producto del mapa que contierne com valor el producto en si
      dataMapResp.forEach((key, value) {
        final tempProduct = ProductModel.fromMap(value);// aqui cargamos en tempProduct el contenido de ABC123 etc
        tempProduct.id = key;// creamos y añadimos un id aprovechando la key de cada producto ex. ABC123
        productList.add(tempProduct); // añadimos al List
      });
      
   
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    isLoading = false;
    notifyListeners();
    return productList;// aunque no lo usamos lo ponemos para informar excatamente 
    // que es lo que devuelve este método. ( realmente usaremps el provider para acceder a la lista de datos)

  }
}