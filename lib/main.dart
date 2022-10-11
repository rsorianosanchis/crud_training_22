import 'package:crud_training_22/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:crud_training_22/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD TRAINING 2022',
      initialRoute: 'home',
      routes:{
        'home':(BuildContext context) => const HomeScreen(),
        'login':(BuildContext context) => const LoginScreen()

      } ,
      theme: CustomTheme.customTheme,

      
    );
  }
}