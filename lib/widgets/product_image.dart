
import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String ?imageUrl;
  const ProductImage({Key? key, this.imageUrl}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: const BoxDecoration(
        //color: Colors.red,
        borderRadius:  BorderRadius.only(topLeft: Radius.circular(45) ,topRight: Radius.circular(45) )
      ),
      child: ClipRRect(

        borderRadius: const BorderRadius.only(topLeft:Radius.circular(45),topRight: Radius.circular(45)),
        child:(imageUrl == null)
          ?const Image(
            image:AssetImage('assets/no-image.png'),
            fit:BoxFit.cover,
          )      
          :(imageUrl!.contains('https://'))
            ?FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'), 
              image: NetworkImage(imageUrl!),
              fit: BoxFit.cover
            )
            :Image.file(
              File(imageUrl!),
              fit: BoxFit.cover,
            )
      )   ,
    ); 
  }
}