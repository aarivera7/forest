import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Importa FontAwesomeIcons
import 'package:socio_bosques/config/presentation/prov/evalucion_predios.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_get.dart';
import 'package:socio_bosques/config/responsive.dart';

class ReportesScreen extends StatefulWidget {
  static const String name = 'reportes';
  const ReportesScreen({Key? key}) : super(key: key);

  @override
  State<ReportesScreen> createState() => _ReportesScreenState();
}

class _ReportesScreenState extends State<ReportesScreen> {
  @override
  Widget build(BuildContext context) {
    final evalucionpred = EvaluacionPredios();
    final responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white,),
        backgroundColor: const Color(0xff102601),
      ),
      body: FutureBuilder(
        future: getForms(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List sortedData = List.from(snapshot.data!)
              ..sort((a, b) => b['fecha'].compareTo(a['fecha']));

            return ListView.builder(
              itemCount: sortedData.length,
              itemBuilder: (context, index) {
                dynamic fechaData = sortedData[index]['fecha'];
                String formattedDateTime = "";

                if (fechaData is String) {
                  formattedDateTime = fechaData;
                } else if (fechaData is Timestamp) {
                  DateTime fecha = fechaData.toDate();
                  formattedDateTime =
                      "${fecha.day}/${fecha.month}/${fecha.year} ${fecha.hour}:${fecha.minute.toString().padLeft(2, '0')}:${fecha.second.toString().padLeft(2, '0')}";
                }

                return GestureDetector(
                  onTap: ()=>{
                    if (sortedData[index]['nombreForm'] == 'Ficha de campo para evalución de predios'){
                      evalucionpred.generateAndSavePDF(context, dataTableForm1(context, sortedData, index, formattedDateTime) )
                    }else{
                      if (sortedData[index]['nombreForm'] == 'Ficha de registro de viveros'){
                      evalucionpred.generateAndSavePDF(context, dataTableForm2(context, sortedData, index, formattedDateTime) )
                    }else
                      if (sortedData[index]['nombreForm'] == 'Formulario de Monitoreo Ambiental'){
                      evalucionpred.generateAndSavePDF(context, dataTableForm3(context, sortedData, index, formattedDateTime) )
                    }else{
                      if (sortedData[index]['nombreForm'] == 'Formulario de postulación'){
                      evalucionpred.generateAndSavePDF(context, dataTableForm4(context, sortedData, index, formattedDateTime) )
                    }else{
                     if (sortedData[index]['nombreForm'] == 'Plan de aprovechamiento forestal'){
                      evalucionpred.generateAndSavePDF(context, dataTableForm5(context, sortedData, index, formattedDateTime) )
                    }else{
                     if (sortedData[index]['nombreForm'] == 'Acta de retención de productos forestales y vida silvestre'){
                      evalucionpred.generateAndSavePDF(context, dataTableForm6(context, sortedData, index, formattedDateTime) )
                    } 
                    } 
                    }
                    }
                    }
                  },
                  child: Card(
                    child: ListTile(
                      leading: Icon(FontAwesomeIcons.file),
                      title: Text(
                        sortedData[index]['nombreForm'] ?? "",
                        style: TextStyle(fontSize: responsive.ip(1.5)),
                      ),
                      subtitle: Text(formattedDateTime),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
   Map<String, String> dataTableForm1(BuildContext context, List<dynamic> sortedData, index, fecha ){
    return{
      'Fecha': fecha,
      'Provincia':sortedData[index]['provincia'],
      'Cantón': sortedData[index]['canton'],
      'Parroquia': sortedData[index]['parroquia'],
      'Cédula': sortedData[index]['cedula'],
      'Superficie en Hectareas': sortedData[index]['hectareas'],
      'Uso Forestal': sortedData[index]['usoForestal'],
      'latitud': sortedData[index]['latitud'].toString(),
      'longitud': sortedData[index]['longitud'].toString(),
      'Imagen': sortedData[index]['image']
      };
  }
   Map<String, String> dataTableForm2(BuildContext context, List<dynamic> sortedData, index, fecha ){
    return{
      'Fecha':sortedData[index]['fecha'].toString().split(' ')[0], 
      'Tipo':sortedData[index]['tipo'],
      'Nombre de la UMA': sortedData[index]['nombreUMA'],
      'Clave de Registro': sortedData[index]['claveRe'],
      'Institución y/o asociasión': sortedData[index]['institucion'],
      'Apartado': 'Propietario',
      'Propietario o razón social': sortedData[index]['propetario'],
      'Titular o Representante legal': sortedData[index]['titularProp'],
      'Teléfono': sortedData[index]['telefonoProp'],
      'Correo': sortedData[index]['correoProp'],
      'RFC': sortedData[index]['rfcProp'],
      'Apartado: ': 'Responsable Tecnico',
      'Propietario / razón social': sortedData[index]['propTec'],
      'Titular / Representante legal': sortedData[index]['titularTec'],
      'Teléfonos': sortedData[index]['telefonoTex'],
      'Fax': sortedData[index]['faxTec'],
      'Correo Electrónico': sortedData[index]['correoTec'],
      'rfc': sortedData[index]['rfcTec'],
      'latitud': sortedData[index]['latitud'].toString(),
      'longitud': sortedData[index]['longitud'].toString(),
      'Imagen': sortedData[index]['image']
      };
  }
   Map<String, String> dataTableForm3(BuildContext context, List<dynamic> sortedData, index, fecha ){
    return{
      'Fecha':sortedData[index]['fecha'].toString().split(' ')[0], 
      'Área':sortedData[index]['area'],
      'Tipo y diseño': sortedData[index]['tipoYdis'],
      'Propetario': sortedData[index]['propetario'],
      'Teléfono del propetario': sortedData[index]['telProp'],
      'Carta de compromiso:': sortedData[index]['cartaComp'],
      'Apartado': 'Datos de parcela',
      'Nombre de parcela': sortedData[index]['nombreParc'],
      'Fecha de monitoreo': sortedData[index]['fechaMoni'],
      'Superficie monitoreada': sortedData[index]['superficieMoni'],
      'Apartado: ': 'Crecimiento',    
      'Numero de árbol': sortedData[index]['numeroArbol'],
      'Altura': sortedData[index]['altura'],
      'Diámetro': sortedData[index]['diametro'],
      'Diametro de copa en E': sortedData[index]['diametro'],
      'Diametro de copa en N': sortedData[index]['diametroN'],
      'Estado fitosanitario': sortedData[index]['estadoFito'],
      'Mantenimiento': sortedData[index]['mantenimiento'],
      'latitud': sortedData[index]['latitud'].toString(),
      'longitud': sortedData[index]['longitud'].toString(),
      'Imagen': sortedData[index]['image']
      };
  }
   Map<String, String> dataTableForm4(BuildContext context, List<dynamic> sortedData, index, fecha ){
    return{
      'Fecha':sortedData[index]['fecha'].toString().split(' ')[0], 
      'Razón social de la empresa':sortedData[index]['razonSo'],
      'Representante legal': sortedData[index]['representante'],
      'Ruc': sortedData[index]['ruc'],
      'Ciudad': sortedData[index]['ciudad'],
      'Dirección': sortedData[index]['direccion'],
      'Contacto': sortedData[index]['contacto'],
      'Número de empleados': sortedData[index]['numEmp'],
      'Categoría en la que participa': sortedData[index]['categoria'],
      'Productos y servicios': sortedData[index]['productos'],
      'Años de funcionamiento': sortedData[index]['funcionamiento'],
      'Misión: ': sortedData[index]['mision'],
      'Vision': sortedData[index]['vision'],
      'latitud': sortedData[index]['latitud'].toString(),
      'longitud': sortedData[index]['longitud'].toString(),
      'Imagen': sortedData[index]['image']
      };
  }
   Map<String, String> dataTableForm5(BuildContext context, List<dynamic> sortedData, index, fecha ){
    return{
      'Fecha':sortedData[index]['fecha'].toString().split(' ')[0], 
      'Tipo':sortedData[index]['tipoOrg'],
      'Nombre o Razon Social:': sortedData[index]['razonSo'],
      'Cedula/Ruc': sortedData[index]['cedRuc'],
      'Representante Legal:': sortedData[index]['representante'],
      'Cedula Representante Legal': sortedData[index]['cedRepresentate'],
      'Dirección': sortedData[index]['direccion'],
      'Ciudad': sortedData[index]['ciudad'],
      'Teléfono': sortedData[index]['email'],
      'E-mail': sortedData[index]['correoProp'],
      'Calidad en que actúa como:': sortedData[index]['calidad'],
      'Apartado: ': 'INFORMACIÓN GENERAL',
      'Tipo de Aprovechamiento:': sortedData[index]['tipoAprovechamiento'],
      'Especies': sortedData[index]['especies'],
      'No. Arboles': sortedData[index]['numArboles'],
      'Volumen': sortedData[index]['volumen'],
      'Nombre Cientifico ': sortedData[index]['nombreCient'],
      'Costo del Proyecto ': sortedData[index]['costoProyect'],
      'apartado': 'INFORMACIÓN GENERAL',
      'Nombre': sortedData[index]['nombreCient'],
      'Escritura Publica No:': sortedData[index]['escrituraPred'],
      'latitud': sortedData[index]['latitud'].toString(),
      'longitud': sortedData[index]['longitud'].toString(),
      'Imagen': sortedData[index]['image']
      };
  }
   Map<String, String> dataTableForm6(BuildContext context, List<dynamic> sortedData, index, fecha ){
    return{
      'Fecha':sortedData[index]['fecha'].toString().split(' ')[0], 
      'Acta de:':sortedData[index]['retencion'],
      'Cédula': sortedData[index]['cedula'],
      'Cantidad:': sortedData[index]['cantidad'],
      'Presentación:': sortedData[index]['presentacion'],
      'Registro': sortedData[index]['registro'],
      'N°: Lote:': sortedData[index]['numLotes'],
      'Producción': sortedData[index]['produccion'],
      'Vencimiento': sortedData[index]['vencimiento'],
      'Nombre y Lic De la Empresa:': sortedData[index]['nombreLicEmpre'],
      'Nombre  y Lic  Retiene o Decomisa:: ': sortedData[index]['nombreLicDecomisa'],
      'Notificado por la empresa:': sortedData[index]['notificado'],
      'Observación': sortedData[index]['observacion'],
      'Nombre': sortedData[index]['nombre'],
      'Cargo': sortedData[index]['cargo'],
      'latitud': sortedData[index]['latitud'].toString(),
      'longitud': sortedData[index]['longitud'].toString(),
      'Imagen': sortedData[index]['image']
      };
  }
}
