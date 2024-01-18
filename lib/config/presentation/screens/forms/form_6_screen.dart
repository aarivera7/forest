import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:socio_bosques/config/responsive.dart';

enum Acta { retencion, decomiso }
enum Accion { faltaEtiqueta, etiquetaNoAprobada, adulteracion, deteriodo, anomalia, sinRegistro  }

class Form6Screen extends StatefulWidget {
  static const String name = 'form6'; 
  const Form6Screen({super.key});

  @override
  State<Form6Screen> createState() => _Form6ScreenState();
}

class _Form6ScreenState extends State<Form6Screen> {
  Acta? _acta = Acta.retencion;
  Accion? _accion = Accion.faltaEtiqueta;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white,),
        backgroundColor: const Color(0xff102601),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Title(
              color: Colors.black, 
              child: Padding(
                padding: EdgeInsets.all(responsive.ip(2.5)),
                child: 
                Text('Datos generales', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff467302),
                    fontSize: responsive.ip(3.3),
                  ),
                )
              )
            ),
        
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Acta de: ", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.ip(2),
                        )
                      ),
                  RadioListTile(
                    title: Text("Retención"),
                    value: Acta.retencion, 
                    groupValue: _acta, 
                    onChanged: (Acta? value) {
                      setState(() {
                        _acta = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Decomiso"),
                    value: Acta.decomiso, 
                    groupValue: _acta, 
                    onChanged: (Acta? value){
                      setState(() {
                        _acta = value;
                      });
                    },
                  ),
                  TextFormField1(label: "Cédula:", hintText: "Ingrese la cédula",),
                  TextFormField1(label: "Fecha: ", hintText: "Ingrese la Fecha",),
                  TextFormField1(label: "Nombre de Producto: ", hintText: "Ingrese nombre del Producto",),
                  TextFormField1(label: "Cantidad:", hintText: "Ingrese la Cantidad ",),
                  TextFormField1(label: "Presentación: ", hintText: "Ingrese la Presentación",),
                  TextFormField1(label: "Registro: ", hintText: "Ingrese el Registro",),
                  TextFormField1(label: "N°: Lote: ", hintText: "Ingrese el N° de Lote",),
                  TextFormField1(label: "Fecha:", hintText: "Ingrese la Fecha",),
                  TextFormField1(label: "Producción:", hintText: "Ingrese  la Producción",),
                  TextFormField1(label: "Fecha de Vencimiento:", hintText: "Ingrese la Fecha de Vencimiento",),
                  TextFormField1(label: "Nombre y Lic De la Empresa:", hintText: "Ingrese el Nombre De La Empresa",),
                  TextFormField1(label: "Nombre  y Lic  Retiene o Decomisa:", hintText: "Ingrese el Nombre Del Que Retiene",),

                  SizedBox(height: responsive.hp(1),),
                  Text("Motivo de acción: ", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.ip(2),
                        )
                      ),
                  RadioListTile(
                    title: Text("Falta de Etiqueta"),
                    value: Accion.faltaEtiqueta,
                    groupValue: _accion, 
                    onChanged: (Accion? value) {
                      setState(() {
                        _accion = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Etiqueta no Aprobada"),
                    value: Accion.etiquetaNoAprobada,
                    groupValue: _accion, 
                    onChanged: (Accion? value){
                      setState(() {
                        _accion = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Adulteración"),
                    value: Accion.adulteracion,
                    groupValue: _accion, 
                    onChanged: (Accion? value){
                      setState(() {
                        _accion = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Deterioro"),
                    value: Accion.deteriodo, 
                    groupValue: _accion, 
                    onChanged: (Accion? value){
                      setState(() {
                        _accion = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Anomalía de Etiqueta"),
                    value: Accion.anomalia, 
                    groupValue: _accion, 
                    onChanged: (Accion? value){
                      setState(() {
                        _accion = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Sin Registro"),
                    value: Accion.sinRegistro, 
                    groupValue: _accion, 
                    onChanged: (Accion? value){
                      setState(() {
                        _accion = value;
                      });
                    },
                  ),

                  TextFormField1(label: "Notificado por la empresa: ", hintText: "Ingrese Notificado Por La Empresa",),
                  TextFormField1(label: "Observación: ", hintText: "Ingrese la Observación",),
                  TextFormField1(label: "Nombre: ", hintText: "Ingrese el Nombre",),
                  TextFormField1(label: "Cédula: ", hintText: "Ingrese la Cédula",),
                  TextFormField1(label: "Cargo: ", hintText: "Ingrese el Cargo",),

                  SizedBox(height: responsive.hp(1),),
                  ElevatedButtons(label: "Enviar", screen: HomeScreen.name), 
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}

