import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';

class Form5Controller {
  TextEditingController razonSocController = TextEditingController(text: "");
  TextEditingController cedRucController = TextEditingController(text: "");
  TextEditingController representanteController = TextEditingController(text: "");
  TextEditingController cedRepresentanteController = TextEditingController(text: "");
  TextEditingController direccionEmpController = TextEditingController(text: "");
  TextEditingController ciudadController = TextEditingController(text: "");
  TextEditingController telefonoController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController especiesController = TextEditingController(text: "");
  TextEditingController numArbolesController = TextEditingController(text: "");
  TextEditingController volumController = TextEditingController(text: "");
  TextEditingController especieAprovController = TextEditingController(text: "");
  TextEditingController nombreaCieController = TextEditingController(text: "");
  TextEditingController costoProyectController = TextEditingController(text: "");
  TextEditingController nombrePredController = TextEditingController(text: "");
  TextEditingController matriculaPredController = TextEditingController(text: "");
  TextEditingController escrituraPredController = TextEditingController(text: "");
  TextEditingController fechaPreController = TextEditingController(text: "");

  void subirDatos(context, tipo, calidad, aprovechamiento, center, url) async {
    await addPlanAprovechamientoForestal("Plan de aprovechamiento forestal" , tipo, razonSocController.text, cedRucController.text,
      representanteController.text, cedRepresentanteController.text, direccionEmpController.text, ciudadController.text,telefonoController.text, emailController.text,
      calidad, aprovechamiento, especiesController.text, numArbolesController.text, volumController.text, especieAprovController.text, nombreaCieController.text,
      costoProyectController.text , nombrePredController.text , matriculaPredController.text , escrituraPredController.text ,
      fechaPreController.text, center.latitude, center.longitude, url, DateTime.now(), ).then((_) {
      context.pushReplacement('/reportes');
      });
  }
}