import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_auth/firebase_auth_services.dart';
import 'package:socio_bosques/config/presentation/screens/auth/login_screen.dart';


class SignUpController {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController nameAndLastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp (context) async{
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpwithEmailAndPassword(email, password);

    if(user != null){
      context.pushReplacementNamed(LoginScreen.name);
    }else{
      print('error al crear usuario');
    }
  }
}