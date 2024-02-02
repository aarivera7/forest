import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen_admin.dart';

class Form2Controller {
  TextEditingController nombreUMAController = TextEditingController(text: "");
  TextEditingController claveRController = TextEditingController(text: "");
  TextEditingController institucionAsController = TextEditingController(text: "");
  TextEditingController propietarioRSocController = TextEditingController(text: "");
  TextEditingController titularRepController = TextEditingController(text: "");
  TextEditingController telefonoPropController = TextEditingController(text: "");
  TextEditingController faxPropController = TextEditingController(text: "");
  TextEditingController correoPropController = TextEditingController(text: "");
  TextEditingController rfcPropController = TextEditingController(text: "");
  TextEditingController propRespoTecController = TextEditingController(text: "");
  TextEditingController titularTecController = TextEditingController(text: "");
  TextEditingController telefonoTecController = TextEditingController(text: "");
  TextEditingController faxTecController = TextEditingController(text: "");
  TextEditingController correoTecController = TextEditingController(text: "");
  TextEditingController rfcTecController = TextEditingController(text: "");

  void subirDatos(BuildContext context, tipo, center, url) async {
    await addFormFichaViveros("Ficha de registro de viveros", tipo ,nombreUMAController.text, claveRController.text,
      institucionAsController.text, propietarioRSocController.text, titularRepController.text, telefonoPropController.text, faxPropController.text, correoPropController.text,
      rfcPropController.text, propRespoTecController.text,titularTecController.text,telefonoTecController.text,faxTecController.text,
      correoTecController.text, rfcTecController.text, center.latitude, center.longitude, url, DateTime.now()).then((_) {
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