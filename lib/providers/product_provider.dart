import 'package:flutter/material.dart';


class ProductProvider extends ChangeNotifier  {

  bool _avaiableProduct = false;

  bool get isAvailable {
    return _avaiableProduct;
  }

  set isAvailable (bool value){
    print(value);
    _avaiableProduct = value;
  }


}