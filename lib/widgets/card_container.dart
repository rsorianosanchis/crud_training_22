import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {

  final Widget child;
  const CardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        // e l height lo anularemos cuando el container tenga contenido
        //height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow:const [
            BoxShadow(
              blurRadius: 15,
              color: Colors.black12,
              offset: Offset(0, 5)
            )
          ] 
        ),
        child: child,
        
      ),
    );
  }
}