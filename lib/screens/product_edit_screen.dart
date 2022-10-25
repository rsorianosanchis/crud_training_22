import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:crud_training_22/providers/providers.dart';
import 'package:crud_training_22/services/products_service.dart';
import 'package:crud_training_22/ui/input_decorations.dart';
import 'package:crud_training_22/widgets/widgets.dart';

class ProductEditScreen extends StatelessWidget {

  static const String routeName = 'product';

  const ProductEditScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    //final ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    final productsService = Provider.of<ProductsService>(context);
    final selectedProduct = productsService.selectedProduct;

    return  ChangeNotifierProvider(
      create: (context) => ProductFormProvider(selectedProduct:selectedProduct),
      child: Scaffold(
        body: SingleChildScrollView(
          //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,//oculta teclado cuando se hace scroll
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              Stack(
                children:  [
                  ProductImage(imageUrl:selectedProduct.picture ),
                  const _ImageIcons(),
    
                ],
              ),
              const _ProductForm()
            ],
    
          ),
        ),
        floatingActionButton: FloatingActionButton(
          
          onPressed: (){},
          child: const Icon(Icons.save)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productFormProvider = Provider.of<ProductFormProvider>(context);
    final selectedProduct = productFormProvider.selectedProduct;
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
              initialValue: selectedProduct.name ,
              onChanged: (value) => selectedProduct.name = value,
              validator: (value) {
                if(value == null || value.isEmpty) return 'A name is obligatory';
              },
              decoration: InputDecorations.productInputDecoration(
                hintText: 'Hint', 
                labelText: 'Label'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              initialValue: '${selectedProduct.price} \$',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
              ],
              onChanged: (value) {
                // como el campo ees de texo (string), intento  parsear para saber si es una entrada valida .
                if(double.tryParse(value) == null){
                  selectedProduct.price = 0;
                }else{
                  selectedProduct.price = double.parse(value);
                }
              },
              validator: (value){
                //if(value == null || value.isEmpty) return 'Product must have a price';
              },
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
              value: selectedProduct.available, 
              onChanged: (value){
                productFormProvider.updateAvailibity(value);
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
        decoration: BoxDecoration(),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
       
            CircleAvatar(

              radius: 30,
              backgroundColor: Colors.black12,
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.5),
                child: IconButton(icon:const Icon(Icons.arrow_back_ios),onPressed:()=>Navigator.of(context).pop(),iconSize: 38,color: Colors.white,),
              ) ,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black12,
              child:IconButton(icon:const Icon(Icons.photo_camera_outlined),onPressed:()=>Navigator.of(context).pop(),iconSize: 40,color: Colors.white,) ,
            )

                       
          ],
        ),
      ),
    );
  }
}