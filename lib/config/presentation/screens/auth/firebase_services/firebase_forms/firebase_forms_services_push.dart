import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> addFormFichaCampo(String nombreForm, String provincia, String canton, String parroquia, String cedula, String hectareas, String? useForestal, double latitud,
double longitud, String url, DateTime fecha ) async{
  await db.collection("forms").add({"nombreForm": nombreForm, "provincia": provincia, 
  "canton": canton, "parroquia": parroquia, 
  "cedula": cedula, "hectareas": hectareas,
  "usoForestal": useForestal , "latitud": latitud,
   "longitud": longitud, "image": url,
   "fecha": fecha,});
}

Future<void> addFormFichaViveros(String nombreForm , String? tipo , String nombre, String claveRe, String institucion, String propetario, String titularProp, String telefonoProp, String faxProp,
String correoProp, String rfcProp, String propTec, String titularTec, String telefonoTec, String faxTec,
String correoTec, String rfcTec, double latitud, double longitud, String url, DateTime fecha ) async{
  await db.collection("forms").add({
  "nombreForm": nombreForm,
  "tipo": tipo, "nombreUMA": nombre, 
  "claveRe": claveRe, "institucion": institucion, 
  "propetario": propetario, "titularProp": titularProp,
  "telefonoProp": telefonoProp , "latitud": faxProp,
  "correoProp": correoProp, "rfcProp": rfcProp,
  "propTec": propTec, "telefonoTex": titularTec,
  "titularTec": telefonoTec, "faxTec": faxTec,
  "correoTec": correoTec, "rfcTec": rfcTec,
  "latitud": latitud, "longitud": longitud,
  "url": url,"fecha": fecha,});
}
Future<void> addFormMonAmbiental(String nombreForm , String fechaFicha , String area, String tipoYdis, String propetario, String telProp, String? cartaComp, String nombreParc, String fechaMoni,
String superficieMoni, String numeroArbol, String especie, String altura, String diametro, String diametroE, String diametroN,
String estadoFito, String mantenimiento, double latitud, double longitud, String url, DateTime fecha ) async{
  await db.collection("forms").add({
  "nombreForm": nombreForm,
  "fechaFicha": fechaFicha, "area": area, 
  "tipoYdis": tipoYdis, "propetario": propetario, 
  "telProp": telProp, "cartaComp": cartaComp,
  "nombreParc": nombreParc , "fechaMoni": fechaMoni,
  "superficieMoni": superficieMoni, "numeroArbol": numeroArbol,
  "altura": altura, "diametro": diametro,
  "diametroE": diametroE, "diametroN": diametroN,
  "estadoFito": estadoFito, "mantenimiento": mantenimiento,
  "latitud": latitud, "longitud": longitud,
  "url": url,"fecha": fecha,});
}
Future<void> addFormPostulacion(String nombreForm, String razonSo, String representante, String ruc, String ciudad, String direccion, 
String contacto, String numEmp,String categoria, String productos, String funcionamiento, String mision, String vision,
double latitud, double longitud, String url, DateTime fecha) async{
  await db.collection("forms").add({"nombreForm": nombreForm, "razonSo": razonSo, 
  "representante": representante, "ruc": ruc, 
  "ciudad": ciudad, "direccion": direccion,
  "contacto": contacto, "numEmp": numEmp,
  "categoria": categoria, "productos": productos,
  "funcionamiento": funcionamiento,
  "mision": mision, "vision": vision,
  "latitud": latitud, "longitud": longitud,
  "url": url, "fecha": fecha  });
}
Future<void> addPlanAprovechamientoForestal( String nombreForm,String? tipo, String razonSo, String cedRuc, String representante, String cedRepresentate, String direccion, 
String ciudad, String telefono,String email, String? calidad,String? tipoAprovechamiento, String especies, String numArboles, String volumen, String especieAprov, String nombreCient, String costoProyect,
 String nombrePred,  String matriculaPred,  String escrituraPred,  String fechaPred, double latitud, double longitud, String url, DateTime fecha,  ) async{
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
  "matriculaPred": matriculaPred,"escrituraPred": escrituraPred,
  "fechaPred": fechaPred, "latitud": latitud, 
  "longitud": longitud, "url": url, 
  "fecha": fecha,
    });
}
Future<void> addPActaRetencionProductos(String nombreForm, String? acta, String nombreProd, String cantidad, String presentacion, String registro, String numLotes, 
String fecha, String produccion,String vencimiento, String nombreLicEmpre, String nombreLicDecomisa, String? accion, String notificado, String observacion, String nombre, String cedula,
String cargo, double latitud, double longitud, String url, DateTime fechas) async{
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
   "latitud": latitud, "longitud": longitud,
  "url": url, "fecha": fechas 
    });
}