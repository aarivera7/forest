import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_1_1_screen.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/resportes/reportes_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:socio_bosques/config/responsive.dart';
enum UseForestal { plantacionesProduccion, agroforestal, regeneracion, reforestacionProteccion, formacionesPioneras }
class Form1Screen extends StatefulWidget {
  static const String name = 'form1'; 
  
  const Form1Screen({super.key});

  @override
  State<Form1Screen> createState() => _Form1ScreenState();
}

class _Form1ScreenState extends State<Form1Screen> {
 String? _useForestal = 'plantacionesProduccion';	
  TextEditingController provinciaController = TextEditingController(text: "");
  TextEditingController cantonController = TextEditingController(text: "");
  TextEditingController parroquiaController = TextEditingController(text: "");
  TextEditingController cedulaController = TextEditingController(text: "");
  TextEditingController superficieController = TextEditingController(text: "");

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
                Text('Ubicación de predios y datos generales', 
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
                  TextFormField1(label: "Provincia", hintText: "Provincia", controller: provinciaController,),
                  TextFormField1(label: "Canton", hintText: "Canton", controller: cantonController,),
                  TextFormField1(label: "Parroquia", hintText: "Parroquia",controller: parroquiaController),
                  TextFormField1(label: "Cédula", hintText: "Cédula", controller: cedulaController,),
                  TextFormField1(label: "Superficie en hectareas", hintText: "Superficie en hectareas", controller: superficieController,),
                  SizedBox(height: responsive.hp(3),),
                  Text('Uso Forestal', style: TextStyle(fontSize: responsive.ip(2)),),
                  SizedBox(height: responsive.hp(3),),
                 RadioListTile(
                    title: Text("Plantaciones: (Producción)"),
                    value: 'plantacionesProduccion',
                    groupValue: _useForestal, 
                    onChanged: (value) {
                      setState(() {
                        _useForestal = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Agroforestal"),
                    value: 'agroforestal', 
                    groupValue: _useForestal, 
                    onChanged: (value) {
                      setState(() {
                        _useForestal = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Regeneración"),
                    value: 'regeneracion', 
                    groupValue: _useForestal, 
                    onChanged: (value) {
                      setState(() {
                        _useForestal = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Reforestación (Protección)"),
                    value: 'reforestacionProteccion', 
                    groupValue: _useForestal, 
                    onChanged: (value) {
                      setState(() {
                        _useForestal = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Formaciones Pioneras"),
                    value: 'formacionesPioneras', 
                    groupValue: _useForestal, 
                    onChanged: (value) {
                      setState(() {
                        _useForestal = value;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      await addFormFichaCampo("Ficha de campo para evalución de predios" ,provinciaController.text, cantonController.text,
                      parroquiaController.text, cedulaController.text, superficieController.text, _useForestal, DateTime.now()).then((_) {
                      context.pushReplacement('/reportes');
                      setState(() {
                      });
                      });
                    },
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

