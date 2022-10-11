import 'package:flutter/material.dart';


class AuthBackground extends StatelessWidget {

  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // este container ocupa todo el fondo de la pantalla
    return SizedBox(
      //color: Colors.red,
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children:  [
          const _PurpleBox(),
          const _HeaderIcon(),
          child,
        ],        
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({super.key});

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.4,
      //color: Colors.indigo,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1),
        ])
      ),
      // Este stack esta dentro y acotado por el por este container de 0.4 screen de alto
      child: Stack(
        children: const [
          // el positiones funciona dentro del stack
          Positioned(top: 90, left: 30,child: _Bubble(),),
          Positioned(top: -40, left: -30,child: _Bubble(),),
          Positioned(top: -50, right: -20,child: _Bubble(),),
          Positioned(bottom: -50, left: 10,child: _Bubble(),),
          Positioned(bottom: 120, right: 20,child: _Bubble(),),
         
        ],

      ),

    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}