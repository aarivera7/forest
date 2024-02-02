import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';

class Form1Controller {
  TextEditingController provinciaController = TextEditingController(text: "");
  TextEditingController cantonController = TextEditingController(text: "");
  TextEditingController parroquiaController = TextEditingController(text: "");
  TextEditingController cedulaController = TextEditingController(text: "");
  TextEditingController superficieController = TextEditingController(text: "");

  void subirDatos (context, image, useForestal, center) async{
    await addFormFichaCampo("Ficha de campo para evalución de predios" ,provinciaController.text, cantonController.text,
    parroquiaController.text, cedulaController.text, superficieController.text, useForestal, center.latitude, center.longitude, image, DateTime.now()).then((_) {
      context.pushReplacement('/reportes');
    });
  }
}