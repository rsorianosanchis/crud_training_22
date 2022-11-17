import 'package:crud_training_22/services/services.dart';
import 'package:crud_training_22/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:crud_training_22/screens/screens.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsService()),
        ChangeNotifierProvider(create: (context) => AuthService()),
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
      scaffoldMessengerKey:NotificationsService.messengerKey,
      //key: NotificationsService.messengerKey, // desde cualquier sitio afectaré a este scaffold si uso los metodos del Notificationservice, gracias , a estar vinculado esta clase con el MaterialApp a través del key
      debugShowCheckedModeBanner: false,
      title: 'CRUD TRAINING 2022',
      initialRoute: 'checking',
      routes:{
        HomeScreen.routeName:(context) => const HomeScreen(),
        LoginScreen.routeName:(context) => const LoginScreen(),
        ProductEditScreen.routeName:(context) => const ProductEditScreen(),
        RegisterScreen.routeName:(context) => const RegisterScreen(),
        CheckAuthScreen.routeName:(context) => const CheckAuthScreen()
      } ,
      theme: CustomTheme.customTheme,
    );
  }
}