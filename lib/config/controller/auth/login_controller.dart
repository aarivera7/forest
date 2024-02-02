import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_auth/firebase_auth_services.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen_admin.dart';


class LoginController {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login (BuildContext context) async {
 
    String email = emailController.text;
    String password = passwordController.text;

    // Cotrolador de autenticación
     User? user =await _auth.signInwithEmailAndPassword(email, password);

  if(user != null){
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
              if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == true) {
           context.pushReplacementNamed(HomeScreenAdmin.name);
        }else{
          context.pushReplacementNamed(HomeScreenUser.name);
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }else{
    print('error al logear usuario');
  }

  }
}