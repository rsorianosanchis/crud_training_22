

import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  // aqui creamos una Key del tipo que vamos a usar para vincular con widget que lo usa. En este caso dentro de un formulario<FormState>

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  set isLoading (bool value){
    _isLoading = value;
    notifyListeners();// aqui lo usamos porque vamos a renderizar un cambio en el boton dependiendo del valor
  }

  bool isValidForm (){

    print('$email - $password');
    // cuando llamamos a este metodo, preguntamos al key, si su widget(formulario) es valido o no.
    print(formKey.currentState?.validate() ?? false);
    return formKey.currentState?.validate() ?? false;
  }




}