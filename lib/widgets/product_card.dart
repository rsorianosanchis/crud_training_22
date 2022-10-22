import 'package:crud_training_22/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final ProductModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 20,bottom: 40),
        width: double.infinity,
        height: 400,
        decoration: _cardDecoration(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children:  [
            _BackGroundImage(product: product),
            _ProductDetails(product:product),
            Positioned(
              top: 0,
              right: 0,
              child: _PriceDetail(product: product),),
             
            if(!product.available)const Positioned(
              top: 0,
              left: 0,
              child:_NotAvailable(),)
          ]
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0,2)
        )
      ]

    );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          topLeft: Radius.circular(25))
      ),
      child: const Text(
        'Not available',
        style: TextStyle(
          color: Colors.white,
          fontSize:20,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class _PriceDetail extends StatelessWidget {
  final ProductModel product;
  const _PriceDetail({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          topRight: Radius.circular(25))
      ),
      child: Text(
        '${product.price} \$',
        style: const TextStyle(
          color: Colors.white,
          fontSize:20,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {

  final ProductModel product;
  const _ProductDetails({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 70),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //alignment: Alignment.centerLeft,
        width:double.infinity,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            topRight: Radius.circular(25)
          )

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              product.name,
              style:const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5,),
            Text(
              'ref.: ${product.id}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )       
          ],
        ),
      ),
    );
  }
}

class _BackGroundImage extends StatelessWidget {

  final ProductModel product;
  const _BackGroundImage({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        height: double.infinity ,
        width: double.infinity,
        child: product.picture== null 
        ? const Image(
          // height: double.infinity ,
          // width: double.infinity,
          image: AssetImage('assets/no-image.png'),
          fit: BoxFit.cover,
        )
        :FadeInImage(
          // height: double.infinity,
          // width: double.infinity,
          placeholder: const AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage(product.picture!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}