import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:socio_bosques/config/responsive.dart';

class Form3Screen2 extends StatelessWidget {
  static const String name = 'form3.2'; 
  const Form3Screen2({super.key});
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
                  TextFormField1(label: "Numero de árbol", hintText: "Ingrese N° de Árbol ",),
                  TextFormField1(label: "Especie", hintText: "Ingrese la Especie",),
                  TextFormField1(label: "Altura", hintText: "Ingrese la Altura",),
                  TextFormField1(label: "Diámetro", hintText: "Ingrese la Diámetro",),
                  TextFormField1(label: "Diametro de copa en E", hintText: "Ingrese la Diametro de copa",),
                  TextFormField1(label: "Diametro de copa en N", hintText: "Ingrese la Diametro de Copa N",),
                  TextFormField1(label: "Estado fitosanitario", hintText: "Ingrese Estado de fitosanitario",),
                  TextFormField1(label: "Mantenimiento", hintText: "Ingrese el Mantenimiento",),
                  SizedBox(height: responsive.hp(1),),
                  ElevatedButtons(label: "Añadir nuevo árbol", screen: Form3Screen2.name), 
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

