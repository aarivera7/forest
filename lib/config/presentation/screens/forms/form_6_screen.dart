import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/controller/forms/form_6_controller.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';
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
  final form6Controller = Form6Controller();
  String? _acta = 'retencion';
  String? _accion = 'faltaEtiqueta';


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
                    value: 'retencion', 
                    groupValue: _acta, 
                    onChanged: (value) {
                      setState(() {
                        _acta = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Decomiso"),
                    value: 'decomiso', 
                    groupValue: _acta, 
                    onChanged: ( value){
                      setState(() {
                        _acta = value;
                      });
                    },
                  ),
                  TextFormField1(label: "Nombre de Producto: ", hintText: "Ingrese nombre del Producto", controller:  form6Controller.nombreEmprProdController),
                  TextFormField1(label: "Cantidad:", hintText: "Ingrese la Cantidad ", controller:  form6Controller.cantidadController),
                  TextFormField1(label: "Presentación: ", hintText: "Ingrese la Presentación", controller:  form6Controller.presentacionController),
                  TextFormField1(label: "Registro: ", hintText: "Ingrese el Registro", controller:  form6Controller.registroController),
                  TextFormField1(label: "N°: Lote: ", hintText: "Ingrese el N° de Lote", controller:  form6Controller.numLoteEmpController),
                  TextFormField1(label: "Fecha:", hintText: "Ingrese la Fecha", controller:  form6Controller.fechaController),
                  TextFormField1(label: "Producción:", hintText: "Ingrese  la Producción", controller:  form6Controller.produccionController),
                  TextFormField1(label: "Fecha de Vencimiento:", hintText: "Ingrese la Fecha de Vencimiento", controller:  form6Controller.vencimientoController),
                  TextFormField1(label: "Nombre y Lic De la Empresa:", hintText: "Ingrese el Nombre De La Empresa", controller:  form6Controller.nombreLicEmpresaController),
                  TextFormField1(label: "Nombre  y Lic  Retiene o Decomisa:", hintText: "Ingrese el Nombre Del Que Retiene", controller:  form6Controller.nombreLicDecomisaController),

                  SizedBox(height: responsive.hp(1),),
                  Text("Motivo de acción: ", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.ip(2),
                        )
                      ),
                  RadioListTile(
                    title: Text("Falta de Etiqueta"),
                    value: 'faltaEtiqueta',
                    groupValue: _accion, 
                    onChanged: (value) {
                      setState(() {
                        _accion = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Etiqueta no Aprobada"),
                    value: 'etiquetaNoAprobada',
                    groupValue: _accion, 
                    onChanged: (value){
                      setState(() {
                        _accion = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Adulteración"),
                    value: 'adulteracion',
                    groupValue: _accion, 
                    onChanged: (value){
                      setState(() {
                        _accion = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Deterioro"),
                    value: 'deteriodo', 
                    groupValue: _accion, 
                    onChanged: (value){
                      setState(() {
                        _accion = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Anomalía de Etiqueta"),
                    value: 'anomalia', 
                    groupValue: _accion, 
                    onChanged: (value){
                      setState(() {
                        _accion = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Sin Registro"),
                    value: 'sinRegistro', 
                    groupValue: _accion, 
                    onChanged: (value){
                      setState(() {
                        _accion = value;
                      });
                    },
                  ),

                  TextFormField1(label: "Notificado por la empresa: ", hintText: "Ingrese Notificado Por La Empresa", controller:  form6Controller.notificadoEmpresaController),
                  TextFormField1(label: "Observación: ", hintText: "Ingrese la Observación", controller:  form6Controller.observacionController),
                  TextFormField1(label: "Nombre: ", hintText: "Ingrese el Nombre", controller:  form6Controller.nombreController),
                  TextFormField1(label: "Cédula: ", hintText: "Ingrese la Cédula", controller:  form6Controller.cedulaController,),
                  TextFormField1(label: "Cargo: ", hintText: "Ingrese el Cargo", controller:  form6Controller.cargoPredController,),

                  SizedBox(height: responsive.hp(1),),
                   ElevatedButton(
                    onPressed: () => form6Controller.subirDatos(context, _acta, _accion),
                    child: Text("FINALIZAR", style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.ip(1.2),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xff467302)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(responsive.ip(1))
                      )),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        horizontal: responsive.wp(8),
                        vertical: responsive.hp(0.75)
                      ))
                    )
                  ) 
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}

