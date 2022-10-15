import 'package:flutter/material.dart';

class InputDecorations {
  // simple metodo(funcion) para centralizar  que nos devuelve el dato que esperamos,
  //en este caso un InputDecoration . Tiene dos argumentos (que no propertis, 
  //no confundor con las propiedades de una clase y su constructor) para personalizar
  static InputDecoration authInputDecoration ({
    required String hintText,
    required String labelText,
    IconData ?prefixIcon,
  }){
    return InputDecoration(
      prefixIcon:  Icon(
        prefixIcon,
        color: Colors.indigo,
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.indigo, )
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.indigo,
          width: 2
        )
      ),
      
      hintText: hintText,
      labelText: labelText,
      
      
    );
  }
  static InputDecoration productInputDecoration ({
    required String hintText,
    required String labelText,
  }){
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.indigo, )
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.indigo,
          width: 2
        )
      ),
      
      hintText: hintText,
      labelText: labelText,
      
      
    );
  }
}

