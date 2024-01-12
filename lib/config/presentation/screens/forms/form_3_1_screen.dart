import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_3_2_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:socio_bosques/config/responsive.dart';

class Form3Screen1 extends StatelessWidget {
  static const String name = 'form3.1'; 
  const Form3Screen1({super.key});
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white,),
        backgroundColor: const Color(0xff102601),
      ),
      body: Column(
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
                TextFormField1(label: "Nombre de parcela", hintText: "Ingrese Nombre de la Parcela",),
                TextFormField1(label: "Fecha de monitoreo", hintText: "Ingrese fecha de monitoreo",),
                TextFormField1(label: "Superficie monitoreada", hintText: "Ingrese la superficie",),
                SizedBox(height: responsive.hp(1),),
                ElevatedButtons(label: "Siguiente", screen: Form3Screen2.name), 
              ],
            ),
          ),
        ]
      ),
    );
  }
}

