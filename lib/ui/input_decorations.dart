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
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Color.fromRGBO(90, 70, 178, 1), )
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.indigo,
          width: 3
        )
      ),
      hintText: hintText,
      labelText: labelText,
      prefixIcon:  Icon(
        prefixIcon,
        color: const Color.fromRGBO(90, 70, 178, 1),
      )
    );
  }
}

