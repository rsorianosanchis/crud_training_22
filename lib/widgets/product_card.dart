import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 20,bottom: 40),
        width: double.infinity,
        height: 400,
        decoration: _cardDecoration(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: const [
            _BackGroundImage(),
            _ProductDetails(),
            Positioned(
              child: _PriceDetail(),
              top: 0,
              right: 0,),
            Positioned(
              child: _NotAvailable(),
              top: 0,
              left: 0,)
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
  const _PriceDetail({
    Key? key,
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
      child: const Text(
        '20000 \$',
        style: TextStyle(
          color: Colors.white,
          fontSize:20,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 70),
      child: Container(
        alignment: Alignment.center,
        width:double.infinity,
        height: 70,
        
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          children: const [
            Text(
              'Hard Disk G',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5,),
            Text(
              'Compatible with Windows Milenium and Monterey',
              style: TextStyle(
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
  const _BackGroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        child: const FadeInImage(
          height: double.infinity,
          width: double.infinity,
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image:  NetworkImage('https://via.placeholder.com/400x300/d6d6d6.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}