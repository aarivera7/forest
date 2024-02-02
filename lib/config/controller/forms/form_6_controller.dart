import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';

class Form6Controller {
  TextEditingController nombreEmprProdController = TextEditingController(text: "");
  TextEditingController cantidadController = TextEditingController(text: "");
  TextEditingController presentacionController = TextEditingController(text: "");
  TextEditingController registroController = TextEditingController(text: "");
  TextEditingController numLoteEmpController = TextEditingController(text: "");
  TextEditingController fechaController = TextEditingController(text: "");
  TextEditingController produccionController = TextEditingController(text: "");
  TextEditingController vencimientoController = TextEditingController(text: "");
  TextEditingController nombreLicEmpresaController = TextEditingController(text: "");
  TextEditingController nombreLicDecomisaController = TextEditingController(text: "");
  TextEditingController notificadoEmpresaController = TextEditingController(text: "");
  TextEditingController observacionController = TextEditingController(text: "");
  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController cedulaController = TextEditingController(text: "");
  TextEditingController cargoPredController = TextEditingController(text: "");

  void subirDatos(context, acta, accion) async {
    await addPActaRetencionProductos("Acta de retención de productos forestales y vida silvestre", acta,nombreEmprProdController.text, cantidadController.text,
      presentacionController.text, registroController.text, numLoteEmpController.text, fechaController.text,produccionController.text, vencimientoController.text,
      nombreLicEmpresaController.text, nombreLicDecomisaController.text, accion,notificadoEmpresaController.text, observacionController.text, nombreController.text,
      cedulaController.text , cargoPredController.text,  DateTime.now()).then((_) {
      context.pushReplacement('/reportes');
      });
  }
}