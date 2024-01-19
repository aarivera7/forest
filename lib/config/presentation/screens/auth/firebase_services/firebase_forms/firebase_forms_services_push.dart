import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> addFormFichaCampo(String nombreForm, String provincia, String canton, String parroquia, String cedula, String hectareas, String? useForestal, DateTime fecha ) async{
  await db.collection("forms").add({"nombreForm": nombreForm, "provincia": provincia, 
  "canton": canton, "parroquia": parroquia, 
  "cedula": cedula, "hectareas": hectareas,
  "usoForestal": useForestal ,"fecha": fecha});
}
Future<void> addFormPostulacion(String nombreForm, String razonSo, String representante, String ruc, String ciudad, String direccion, 
String contacto, String numEmp,String categoria, String productos, String funcionamiento, String mision, String vision, DateTime fecha) async{
  await db.collection("forms").add({"nombreForm": nombreForm, "razonSo": razonSo, 
  "representante": representante, "ruc": ruc, 
  "ciudad": ciudad, "direccion": direccion,
   "contacto": contacto, "numEmp": numEmp,
    "categoria": categoria, "productos": productos,
     "funcionamiento": funcionamiento,
     "mision": mision, "vision": vision,
     "fecha": fecha  });
}
Future<void> addPlanAprovechamientoForestal( String nombreForm,String? tipo, String razonSo, String cedRuc, String representante, String cedRepresentate, String direccion, 
String ciudad, String telefono,String email, String? calidad,String? tipoAprovechamiento, String especies, String numArboles, String volumen, String especieAprov, String nombreCient, String costoProyect,
 String nombrePred,  String matriculaPred,  String escrituraPred,  String fechaPred, DateTime fecha,  ) async{
  await db.collection("forms").add({
  "tipoOrg": tipo,
  "nombreForm": nombreForm, "razonSo": razonSo, 
  "cedRuc": cedRuc, "representante": representante, 
  "cedRepresentate": cedRepresentate, "direccion": direccion,
  "ciudad": ciudad, "telefono": telefono,
  "email": email, "calidad": calidad, 
  "tipoAprovechamiento": tipoAprovechamiento,"especies": especies,
  "numArboles": numArboles,"volumen": volumen, 
  "especieAprov": especieAprov, "nombreCient": nombreCient,
   "costoProyect": costoProyect, "nombrePred": nombrePred, 
   "matriculaPred": matriculaPred,
   "escrituraPred": escrituraPred,
   "fechaPred": fechaPred, "fecha": fecha,
    });
}
Future<void> addPActaRetencionProductos(String nombreForm, String? acta, String nombreProd, String cantidad, String presentacion, String registro, String numLotes, 
String fecha, String produccion,String vencimiento, String nombreLicEmpre, String nombreLicDecomisa, String? accion, String notificado, String observacion, String nombre, String cedula,
String cargo, DateTime fechas) async{
  await db.collection("forms").add({
  "nombreForm": nombreForm, 'acta': acta,
  "nombreProd": nombreProd, 
  "cantidad": cantidad, "presentacion": presentacion, 
  "registro": registro, "numLotes": numLotes,
  "ciudad": fecha, "produccion": produccion,
  "vencimiento": vencimiento, "nombreLicEmpre": nombreLicEmpre,
  "nombreLicDecomisa": nombreLicDecomisa, 'accion':accion,
  "notificado": notificado, 
  "observacion": observacion, "nombre": nombre,
   "cedula": cedula, "cargo": cargo,
   "fecha": fechas 
    });
}