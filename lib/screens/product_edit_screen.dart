import 'package:crud_training_22/models/product_model.dart';
import 'package:crud_training_22/services/products_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_training_22/providers/product_provider.dart';
import 'package:crud_training_22/ui/input_decorations.dart';
import 'package:crud_training_22/widgets/widgets.dart';

class ProductEditScreen extends StatelessWidget {

  static const String routeName = 'product';

  const ProductEditScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return  Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Stack(
              children: const [
                ProductImage(),
                _ImageIcons(),

              ],
            ),
            ChangeNotifierProvider(
              create: ((context) => ProductProvider()),
              child: const _ProductForm()
            )
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: (){},
        child: const Icon(Icons.save)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:45),
      width: double.infinity,
      decoration: _productFormDecoration(),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child:Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
     
            TextFormField(

              decoration: InputDecorations.productInputDecoration(
                hintText: 'Hint', 
                labelText: 'Label'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecorations.productInputDecoration(
                hintText: ' \$', 
                labelText: 'Price'
              ),
            ),
            SizedBox(height: 20,),
            SwitchListTile.adaptive(
              
              title: Text('Available'),
              activeColor: Colors.indigo,
              value: productProvider.isAvailable, 
              onChanged: (value){
                productProvider.isAvailable = value;
              }
            ),
            SizedBox(height: 20,),
          ],

        )
      ),
    );
  }

  BoxDecoration _productFormDecoration() {
    return  BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(45),
        bottomRight: Radius.circular(45)
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 2,
          offset:const Offset(2, 3)
        )
      ]
      
    );
  }
}

class _ImageIcons extends StatelessWidget {
  const _ImageIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon:const Icon(Icons.arrow_back_ios),onPressed:()=>Navigator.of(context).pop() , iconSize: 40,color: Colors.white,),
            IconButton(icon:const Icon(Icons.photo_camera_outlined),onPressed:(){} , iconSize: 40,color: Colors.white,),                  
          ],
        ),
      ),
    );
  }
}