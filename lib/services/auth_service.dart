import 'package:flutter/material.dart';
import 'dart:convert';
import  'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends ChangeNotifier {
  
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyCmu_dtl1VC286QbVrZStB0cvEzCNX5s84'; // éste NO es el token de auth del usuario, sin, el token de acceso como developer a nuestro servicio API  al auth de firebaseß
  final storage = new FlutterSecureStorage();

  //SI retornnamos algo que sea un ERROR, si retornamos null es que todo ha ido nien (hemos recibido token y lo guardaremos en liugar seguro para usarlo después)
  Future<String?> createUserRequest (String email, String password)async{

    final Map<String,dynamic> authRegisterBodyData = {
      'email':email,
      'password':password,
      'returnSecureToken':true
    };

    final url = Uri.https(_baseUrl,'v1/accounts:signUp',{'key':_firebaseToken});

    final response = await http.post(url, body: jsonEncode(authRegisterBodyData));
    final Map<String,dynamic> decodedResponse = jsonDecode(response.body);
    
    if(response.statusCode == 200 && decodedResponse.containsKey('idToken')){
      //TO DO: guardar token en un lugar seguro
      await storage.write(key: 'usrToken',value: decodedResponse['idToken']);
      //
      print(decodedResponse);
      print(decodedResponse['idToken']);
      return null;
    }else{
      print(decodedResponse);
      print(decodedResponse['error']['message']);
      return decodedResponse['error']['message'];

    }
  }
  Future<String?> loginUserRequest (String email, String password) async {
    final url = Uri.https(_baseUrl,'v1/accounts:signInWithPassword',{'key':_firebaseToken});
    final Map<String,dynamic> authLoginBodyData = {
      'email':email,
      'password':password,
      'returnSecureToken':true
    };
    final response = await http.post(url,body: jsonEncode(authLoginBodyData));
    final Map<String,dynamic> decodedResponse = jsonDecode(response.body);
    if(response.statusCode == 200 && decodedResponse.containsKey('idToken')){
      //TO DO: guardar token en un lugar seguro
      await storage.write(key: 'usrToken',value: decodedResponse['idToken']);
      print(decodedResponse);
      print(decodedResponse['idToken']);
      return null;
    }else{
      print(decodedResponse);
      print(decodedResponse['error']['message']);
      return decodedResponse['error']['message'];

    }
  }

  Future<void> logOut ()async{
    
    await storage.delete(key: 'usrToken');
    return;
  }

  Future<String> readToken()async{

    return await storage.read(key: 'usrToken')?? ''; // hacemos que este futuro devuelva siempre un string aunque sea vacioi. Porque lo conectaremos a un builder que necesitará siempre algún dato.

  }





}

