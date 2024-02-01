import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Importa FontAwesomeIcons
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
                  onTap: (){},
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
}
