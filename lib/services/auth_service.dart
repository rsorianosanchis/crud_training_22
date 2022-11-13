import 'dart:convert';

import 'package:flutter/material.dart';
import  'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  
  final String _baseUrl = 'identitytoolkit.googleapis.com/';
  final String _firebaseToken = 'AIzaSyCmu_dtl1VC286QbVrZStB0cvEzCNX5s84'; // éste NO es el token de auth del usuario, sin, el token de acceso a nuestro servicio API como developer al uth de firebase

  Future<String?> createUser(String email, String password)async{
    final Map<String,dynamic> authData = {
      'email':email,
      'password':password
    };
    final url = Uri.https(_baseUrl,'/v1/accounts:signUp',{'key':_firebaseToken});

    final response = await http.post(url, body: jsonEncode(authData));

    final Map<String,dynamic> decodedResponse = jsonDecode(response.body);
    print(decodedResponse);

  }



}

