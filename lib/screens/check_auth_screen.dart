import 'package:crud_training_22/screens/screens.dart';
import 'package:crud_training_22/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  static String routeName = 'checking';
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return FutureBuilder(
      future: authService.readToken(),
      builder: ((context, snapshot) {
        if(!snapshot.hasData)return const Center(child:Text('Wait...'));

        if(snapshot.data == ''){
          Future.microtask((){
              //Navigator.pushReplacementNamed(context, 'home');
              // Con este Navigator evitamos el salto de transicion. Secrea una navegacion instantanea
              Navigator.pushReplacement(
                context, 
                PageRouteBuilder(
                  pageBuilder: ((_, __, ___) => const LoginScreen()),
                  transitionDuration: const Duration(seconds: 0)
                )
              );
            }
          );  
        }else{
              Future.microtask((){
              //Navigator.pushReplacementNamed(context, 'home');
              // Con este Navigator evitamos el salto de transicion. Secrea una navegacion instantanea
              Navigator.pushReplacement(
                context, 
                PageRouteBuilder(
                  pageBuilder: ((_, __, ___) => const HomeScreen()),
                  transitionDuration: const Duration(seconds: 0)
                )
              );
            }
          );  

        }
        
  
        return Container();
        
      }));
  }
}