import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen_admin.dart';

class Form1Controller {
  TextEditingController provinciaController = TextEditingController(text: "");
  TextEditingController cantonController = TextEditingController(text: "");
  TextEditingController parroquiaController = TextEditingController(text: "");
  TextEditingController cedulaController = TextEditingController(text: "");
  TextEditingController superficieController = TextEditingController(text: "");

  // Metodo para subir datos a firebase
  void subirDatos (BuildContext context, image, useForestal, center) async{
    await addFormFichaCampo("Ficha de campo para evalución de predios" ,provinciaController.text, cantonController.text,
    parroquiaController.text, cedulaController.text, superficieController.text, useForestal, center.latitude, center.longitude, image, DateTime.now()).then((_) {
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
    });
  }
}