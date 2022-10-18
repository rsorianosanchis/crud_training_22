import 'package:crud_training_22/services/services.dart';
import 'package:crud_training_22/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:crud_training_22/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsService()),
      ],
      child: const MyApp()
    );
  }
}


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD TRAINING 2022',
      initialRoute: 'home',
      routes:{
        HomeScreen.routeName:(context) => const HomeScreen(),
        LoginScreen.routeName:(context) => const LoginScreen(),
        ProductEditScreen.routeName:(context) => const ProductEditScreen()

      } ,
      theme: CustomTheme.customTheme,

      
    );
  }
}