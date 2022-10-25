import 'package:crud_training_22/models/models.dart';
import 'package:flutter/material.dart';


class ProductFormProvider extends ChangeNotifier  {

  GlobalKey<FormState> formKey  = new GlobalKey<FormState>();

  // Vamos a importrar el producto aqui en el provider para manejarlo
  ProductModel selectedProduct;

  ProductFormProvider({required this.selectedProduct});
  //

  updateAvailibity (bool value){
    print(value);
    selectedProduct.available = value;
    notifyListeners();
  }
  
  bool isValidForm (){
    return formKey.currentState?.validate() ?? false;
  }
}