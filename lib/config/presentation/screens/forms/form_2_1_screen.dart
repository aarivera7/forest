import 'package:flutter/material.dart';

import 'package:socio_bosques/config/presentation/screens/forms/form_2_2_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:socio_bosques/config/responsive.dart';

class Form2Screen1 extends StatelessWidget {
  static const String name = 'form2_1'; 
  const Form2Screen1({super.key});
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
                Text('Propietario', 
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
                  TextFormField1(label: "Propietario o razón social", hintText: "Ingrese el Propietario o razón social",),
                  TextFormField1(label: "Titular o representante legal", hintText: "Ingrese Representante legal",),
                  TextFormField1(label: "Teléfono", hintText: "Ingrese Teléfono",),
                  TextFormField1(label: "Fax", hintText: "Ingrese Fax",),
                  TextFormField1(label: "Correo electrónico", hintText: "Ingrese Correo Electrónico",),
                  TextFormField1(label: "RFC", hintText: "Ingrese RFC",),
                  SizedBox(height: responsive.hp(1),),
                  ElevatedButtons(label: "Siguiente", screen: Form2Screen2.name), 
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}

