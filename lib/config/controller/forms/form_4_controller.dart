import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';

class Form4Controller {
  TextEditingController razonEmpController = TextEditingController(text: "");
  TextEditingController representController = TextEditingController(text: "");
  TextEditingController rucController = TextEditingController(text: "");
  TextEditingController ciudadController = TextEditingController(text: "");
  TextEditingController direcController = TextEditingController(text: "");
  TextEditingController contactoController = TextEditingController(text: "");
  TextEditingController numeroEmpleController = TextEditingController(text: "");
  TextEditingController categoriaController = TextEditingController(text: "");
  TextEditingController productosController = TextEditingController(text: "");
  TextEditingController anosFuncionamientoController = TextEditingController(text: "");
  TextEditingController misionController = TextEditingController(text: "");
  TextEditingController visionController = TextEditingController(text: "");

  void subirDatos(context, center, url) async {
    await addFormPostulacion("Formulario de postulación" ,razonEmpController.text, representController.text,
      rucController.text, ciudadController.text, direcController.text, contactoController.text,numeroEmpleController.text, categoriaController.text,
      productosController.text, anosFuncionamientoController.text, misionController.text, visionController.text, center.latitude, center.longitude, url, DateTime.now())
      .then((_) {
        context.pushReplacement('/reportes');
      });
  }
}