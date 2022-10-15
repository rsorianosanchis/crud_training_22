import 'package:flutter/material.dart';


class ProductProvider extends ChangeNotifier  {

  bool _avaiableProduct = true;

  bool get isAvailable {
    return _avaiableProduct;
  }

  set isAvailable (bool value){
    _avaiableProduct = value;
  }


}