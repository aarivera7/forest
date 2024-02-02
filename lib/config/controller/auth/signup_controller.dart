import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_auth/firebase_auth_services.dart';
import 'package:socio_bosques/config/presentation/screens/auth/login_screen.dart';


class SignUpController {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController nameAndLastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Se encarga del registro de usuario
  void signUp (context) async{
    String email = emailController.text;
    String password = passwordController.text;

    // Se encarga de registrar el usuario
    User? user = await _auth.signUpwithEmailAndPassword(email, password);

    if(user != null){

      // Se encarga de enviar al usuario a la pantalla de login
      context.pushReplacementNamed(LoginScreen.name);
    }else{
      print('error al crear usuario');
    }
  }
}