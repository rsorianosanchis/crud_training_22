
import 'package:crud_training_22/providers/login_form_provider.dart';
import 'package:crud_training_22/theme/custom_theme.dart';
import 'package:crud_training_22/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:crud_training_22/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {

  static const String routeName = 'register';
   
  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 220),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Text('Register',style: Theme.of(context).textTheme.headline4),
                    ChangeNotifierProvider(
                      create: (context) => LoginFormProvider(),
                      child: const _LoginForm()
                    ),
              
                  ],
                ) 
              ),
              const SizedBox(height: 50,),
              TextButton(
                onPressed: ()=>Navigator.pushReplacementNamed(context, 'login'), 
                style: CustomTheme.customButtonLoginReg,
                child: const Text(
                  'Have an account already?',
                  style: TextStyle(color: Colors.black45,fontSize: 18),
                ),
              ),
              const SizedBox(height: 80,),
            ],
          ),
        )
      )      
    );
  }
}


class _LoginForm extends StatelessWidget {

  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {

    final loginFormProvider = Provider.of<LoginFormProvider>(context);

    return Form(
      //TODO: mantener refrencia al key
      key: loginFormProvider.formKey,
      // con el key controlamos todas las validaciones al presionar boton de aceptar.
      // con los validators internos de cada field junto con el autovalidateMode, lo que hacemos es validar mientrasingresamos valores en los campos
      // con el del key lanzamos valicaiones por ejemplo cuando damos sin querer a aceptar sin haber escrito nada o solo parcialmenete
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'jonhy@walker.com',
              labelText: 'e-Mail',
              prefixIcon: Icons.email
            ),
            onChanged: (value) => loginFormProvider.email = value,// cargamso datos en variable provider
            // el validator da ok si devulve null. Si devuelve string es que hemos rellenado mal el campo
            validator: (value){
              // patron de lo que es un mail con buen formato
              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              // creamos la expresion regular con el patron
              RegExp regExp  = new RegExp(pattern); 
              // cogemos la expresion regular y le preguntamos si hace match con el value de los que se ha introducido en el campo
              // si no se ha escrito nada en el campo u value es null, le cargamos string vacio. (value??'')
              return regExp.hasMatch(value ??'')
                ? null
                : 'Email format not valid'; 
            } ,     // si regresa un string (en este caso 'hola') se imprime debajo, si regresa null significa que pasó la validacion  
          ),
          const SizedBox(height: 30,),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'min 6 char.',
              labelText: 'Password',
              prefixIcon: Icons.lock
            ),
            onChanged: (value) => loginFormProvider.password = value,
            validator: (value) {
             
              return value != null && value.length >= 6
                ?null
                :'Password must have 6 or more char.';

            } ,     // si regresa u       
          ),
          const SizedBox(height: 30,),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7)
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            color: const  Color.fromRGBO(90, 70, 178, 1),

            onPressed: loginFormProvider.isLoading ?null: ()async{
              //TODO: login submit
              //quitamos el teclado para que no moleste al pulsar el boton
              FocusScope.of(context).unfocus();
             
              if(!loginFormProvider.isValidForm())return;
              //
              // ha sido validado ok
              loginFormProvider.isLoading = true;
              //temp
              await Future.delayed(const Duration(seconds: 2));
              
              //TODO: validar si el backend acepta el login antes de ingresar a home
              Navigator.pushReplacementNamed(context,'home');

              // SI EL FORMULARIO ES VALIDO PODEMOS HACER YA PETICION HTTP O LO QUE SEA
            },
            child: Container(
              padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Text(loginFormProvider.isLoading?'Wait...':'Submit',
                style: const TextStyle(color: Colors.white),
              )  
            ),
          )
    
        ],
      ),
    );
  } 
}