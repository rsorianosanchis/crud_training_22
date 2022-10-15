import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
   
  const ProductImage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius:  BorderRadius.only(topLeft: Radius.circular(40) ,topRight: Radius.circular(40) )
      ),
      child: const ClipRRect(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight: Radius.circular(40)),
        child: FadeInImage(

          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/600x400/a7db8a/848c84.jpg'),
          fit: BoxFit.cover),
      ), 
    );
  }
}