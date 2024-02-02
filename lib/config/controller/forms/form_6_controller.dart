import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen_admin.dart';

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

  void subirDatos(BuildContext context, acta, accion, center, url) async {
    await addPActaRetencionProductos("Acta de retención de productos forestales y vida silvestre", acta,nombreEmprProdController.text, cantidadController.text, presentacionController.text, registroController.text, numLoteEmpController.text, fechaController.text,produccionController.text, vencimientoController.text,
    nombreLicEmpresaController.text, nombreLicDecomisaController.text, accion,notificadoEmpresaController.text, observacionController.text, nombreController.text,
    cedulaController.text , cargoPredController.text,  center.latitude, center.longitude, url, DateTime.now()).then((_) {
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