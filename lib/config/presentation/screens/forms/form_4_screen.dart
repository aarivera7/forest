import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:socio_bosques/config/responsive.dart';

class Form4Screen extends StatelessWidget {
  static const String name = 'form4'; 
  const Form4Screen({super.key});
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
                  TextFormField1(label: "Razón social de la empresa", hintText: "Ingrese la Razon Social ",),
                  TextFormField1(label: "Representante legal", hintText: "Ingrese el representante Legal",),
                  TextFormField1(label: "Ruc", hintText: "Ingrese el Ruc",),
                  TextFormField1(label: "Ciudad", hintText: "Ingrese la Cuidad",),
                  TextFormField1(label: "Dirección", hintText: "Ingrese la Dirección",),
                  TextFormField1(label: "Contacto", hintText: "Ingrese su Contacto",),
                  TextFormField1(label: "Número de empleados", hintText: "Ingrese número de empleados",),
                  TextFormField1(label: "Categoría en la que participa", hintText: "Ingrese la Categoría",),
                  TextFormField1(label: "Productos y servicios", hintText: "Ingrese productos y servicios",),
                  TextFormField1(label: "Años de funcionamiento", hintText: "Ingrese los años de funcionamiento",),
                  TextFormField1(label: "Misión", hintText: "Ingrese la Misión",),
                  TextFormField1(label: "Vision", hintText: "Ingrese la visión",),
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

