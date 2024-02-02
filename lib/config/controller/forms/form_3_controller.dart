import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen_admin.dart';

class Form3Controller {
  TextEditingController fechaController = TextEditingController(text: "");
  TextEditingController areaController = TextEditingController(text: "");
  TextEditingController tipoDisController = TextEditingController(text: "");
  TextEditingController propietarioController = TextEditingController(text: "");
  TextEditingController telefonoController = TextEditingController(text: "");
  TextEditingController nombreParcController = TextEditingController(text: "");
  TextEditingController fechaMoniController = TextEditingController(text: "");
  TextEditingController superfMonController = TextEditingController(text: "");
  TextEditingController numeroArController = TextEditingController(text: "");
  TextEditingController especieController = TextEditingController(text: "");
  TextEditingController alturaController = TextEditingController(text: "");
  TextEditingController diametroController = TextEditingController(text: "");
  TextEditingController diametroEController = TextEditingController(text: "");
  TextEditingController diametroNController = TextEditingController(text: "");
  TextEditingController estadoFitoController = TextEditingController(text: "");
  TextEditingController mantenimientoController = TextEditingController(text: "");

  void subirDatos(BuildContext context, letter, center, url) async {
    await addFormMonAmbiental("Formulario de Monitoreo Ambiental" ,fechaController.text, areaController.text,
      tipoDisController.text, propietarioController.text, telefonoController.text, letter, nombreParcController.text,fechaMoniController.text, superfMonController.text,
        numeroArController.text, especieController.text,alturaController.text,diametroController.text,diametroEController.text,diametroNController.text, 
        estadoFitoController.text, mantenimientoController.text, center.latitude, center.longitude, url,DateTime.now()).then((_) {
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