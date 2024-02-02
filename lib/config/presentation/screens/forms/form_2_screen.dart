import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_2_1_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:socio_bosques/config/responsive.dart';

enum Tipo { vivero, jardin }

class Form2Screen extends StatefulWidget {
  static const String name = 'form2'; 
  const Form2Screen({super.key});

  @override
  State<Form2Screen> createState() => _Form2ScreenState();
}

class _Form2ScreenState extends State<Form2Screen> {
  Tipo? _tipo = Tipo.vivero;

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
                Text('Datos Generales', 
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
                  Text("Tipo: ", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.ip(2),
                        )
                      ),
                  RadioListTile(
                    title: Text("Vívero"),
                    value: Tipo.vivero, 
                    groupValue: _tipo, 
                    onChanged: (Tipo? value) {
                      setState(() {
                        _tipo = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Jardín botánico"),
                    value: Tipo.jardin, 
                    groupValue: _tipo, 
                    onChanged: (Tipo? value){
                      setState(() {
                        _tipo = value;
                      });
                    },
                  ),
                  TextFormField1(label: "Nombre de la UMA", hintText: "Ingrese el nombre la UMA",),
                  TextFormField1(label: "Clave de registro", hintText: "Ingrese su clave",),
                  TextFormField1(label: "Institución Y/0 asociasión", hintText: "Ingrese su la institución",),
                  SizedBox(height: responsive.hp(1),),
                  ElevatedButtons(label: "Siguiente", screen: Form2Screen1.name), 
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}

