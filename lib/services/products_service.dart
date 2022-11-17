import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crud_training_22/models/product_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  //https://crud-products-8fcd5-default-rtdb.europe-west1.firebasedatabase.app/
  final String _urlBase = 'crud-products-8fcd5-default-rtdb.europe-west1.firebasedatabase.app';
  //final String _urlBase = 'https://flutter-training-8f59b-default-rtdb.europe-west1.firebasedatabase.app/products.json';
  final List<ProductModel> productList = [];
  // este es el product que usamos para pasar datos cuando clikamos sobre la lista uno en concreto. Por cambiar
  // de metodo y no usar los arguments de navoigator
  late ProductModel selectedProduct;
  //
  final storage = const FlutterSecureStorage();

  File? newPictureFile; // import 'dart:io';

  bool isLoading = true;
  bool isSaving = false;

  ProductsService(){
    loadProducts();
  }

  //TODO: return <List<ProductModel>>
  Future <List<ProductModel>> loadProducts()async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_urlBase,'products.json',{'auth': await storage.read(key: 'usrToken') ?? ''});
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
    print(productList);
    return productList;// aunque no lo usamos lo ponemos para informar excatamente 
    // que es lo que devuelve este método. ( realmente usaremps el provider para acceder a la lista de datos)

  }

  Future saveOrCreateProduct (ProductModel product)async {
    isSaving = true;
    notifyListeners();

    if(product.id == null){
      // es producto nuevo porque no tiene Id
      await createProduct(product);

    }else{
      // existe pues es actualizar
      await updateProduct(product);
      
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> createProduct (ProductModel product )async{
    //https://flutter-training-8f59b-default-rtdb.europe-west1.firebasedatabase.app/products/ABC123
    final url = Uri.https(_urlBase,'products.json',{'auth': await storage.read(key: 'usrToken') ?? ''});
    final response = await http.post(url,body: product.toJson() );
    final decodedData = response.body;

    print(decodedData);
    product.id = jsonDecode(decodedData)['name'];
    productList.add(product);
    //ProductModel temp = productList.contains(product.i);
    // 
    return product.id!;
  }

  Future<String> updateProduct (ProductModel product )async{
    //https://flutter-training-8f59b-default-rtdb.europe-west1.firebasedatabase.app/products/ABC123
    final url = Uri.https(_urlBase,'products/${product.id}.json',{'auth': await storage.read(key: 'usrToken') ?? ''});
    final response = await http.put(url,body: product.toJson() );
    final decodedData = response.body;

    print(decodedData);
    //ProductModel temp = productList.contains(product.i);
    // 
    final int indexOfModifiedProduct = productList.indexWhere((element)=>element.id == product.id);
    productList[indexOfModifiedProduct]=product;
    return product.id!;
  }
  Future  deleteProduct (ProductModel product )async{
    //https://flutter-training-8f59b-default-rtdb.europe-west1.firebasedatabase.app/products/ABC123
    final url = Uri.https(_urlBase,'products/${product.id}.json',{'auth': await storage.read(key: 'usrToken') ?? ''});
    final response = await http.delete(url,body: product.toJson() );
    final decodedData = response.body;

    print('response delete : $decodedData');
    //ProductModel temp = productList.contains(product.i);
    // 
    final int indexOfModifiedProduct = productList.indexWhere((element)=>element.id == product.id);
    productList.removeAt(indexOfModifiedProduct);
    notifyListeners();
  }

  void updateSelectedProductImage (String imagePath){
    selectedProduct.picture = imagePath; // aqui en vez de url le damos path the hardware pero haremos el filtro mas adelante
    newPictureFile = File.fromUri(Uri(path: imagePath)); // aqui almacenamos el archivo de la nueva imagen, luego la subiremos a cloudinary
    
    notifyListeners();

  }

  Future<String?> upLoadImage()async{

    if(newPictureFile == null) return null;// hago este chequeo por si accidentalmente se intenta subir la imagen siendo el contenido null, por ejemplo grabando sin seleccionar imagen
    isSaving = true;
    notifyListeners();

    final url = Uri.parse('https://api.cloudinary.com/v1_1/drwf46cuh5z/image/upload?upload_preset=mhldsmzd');

    final imageUploadRequest = http.MultipartRequest('POST',url); // este es el request preparado

    final file = await http.MultipartFile.fromPath('file', newPictureFile!.path);// aqui preparamos  el archivo al request con la key 'file' que usa en el body

    imageUploadRequest.files.add(file);// aqui machambramos ya todo. request + file

    final streameResponse = await imageUploadRequest.send(); // enviamos peticion
    final resp = await http.Response.fromStream(streameResponse); // response del streamed enviado

    if(resp.statusCode != 200 && resp.statusCode != 201){
      print('somthing went wrong with request');
      print(resp.body);
      return null;
    }
    newPictureFile = null; // asi indicamos que ya fue subido y no lo dejamos en memoria

    final decodedData = jsonDecode(resp.body);
    return decodedData['secure_url'];
    
  }

}