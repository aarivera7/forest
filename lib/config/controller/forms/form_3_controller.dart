import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';

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

  void subirDatos(context, letter, center, url) async {
    await addFormMonAmbiental("Formulario de Monitoreo Ambiental" ,fechaController.text, areaController.text,
      tipoDisController.text, propietarioController.text, telefonoController.text, letter, nombreParcController.text,fechaMoniController.text, superfMonController.text,
        numeroArController.text, especieController.text,alturaController.text,diametroController.text,diametroEController.text,diametroNController.text, 
        estadoFitoController.text, mantenimientoController.text, center.latitude, center.longitude, url,DateTime.now()).then((_) {
      context.pushReplacement('/reportes');
      });
  }
}