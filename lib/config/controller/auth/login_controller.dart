import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_auth/firebase_auth_services.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';


class LoginController {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login (BuildContext context) async {
 
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInwithEmailAndPassword(email, password);

    if(user != null){
      // ignore: use_build_context_synchronously
      context.pushReplacementNamed(HomeScreen.name);
    }else{
      print('error al logear usuario');
    }

  }
}