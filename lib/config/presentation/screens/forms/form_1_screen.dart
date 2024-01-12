import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_1_1_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:socio_bosques/config/responsive.dart';

class Form1Screen extends StatelessWidget {
  static const String name = 'form1'; 
  const Form1Screen({super.key});
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
                  TextFormField1(label: "Provincia", hintText: "Provincia",),
                  TextFormField1(label: "Canton", hintText: "Canton",),
                  TextFormField1(label: "Parroquia", hintText: "Parroquia",),
                  TextFormField1(label: "Cédula", hintText: "Cédula",),
                  TextFormField1(label: "Superficie en hectareas", hintText: "Superficie en hectareas",),
                  SizedBox(height: responsive.hp(1),),
                  ElevatedButtons(label: "Siguiente", screen: Form1Screen1.name), 
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}

