import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_3_1_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:socio_bosques/config/responsive.dart';

enum Letter { yes, no }

class Form3Screen extends StatefulWidget {
  static const String name = 'form3'; 
  const Form3Screen({super.key});

  @override
  State<Form3Screen> createState() => _Form3ScreenState();
}

class _Form3ScreenState extends State<Form3Screen> {
  Letter? _letter = Letter.yes;

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
                Text('Ficha de Monitoreo', 
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
                  TextFormField1(label: "Fecha", hintText: "Ingrese la fecha",),
                  TextFormField1(label: "Área", hintText: "Ingrese el Área",),
                  TextFormField1(label: "Tipo y diseño", hintText: "Ingrese el tipo o diseño",),
                  TextFormField1(label: "Propetario", hintText: "Ingrese el propietario",),
                  TextFormField1(label: "Teléfono del propetario", hintText: "Ingrese numero de teléfono",),
                  Text("Carta de compromiso", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.ip(2),
                        )
                      ),
                  RadioListTile(
                    title: Text("Sí"),
                    value: Letter.yes, 
                    groupValue: _letter, 
                    onChanged: (Letter? value) {
                      setState(() {
                        _letter = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("No"),
                    value: Letter.no, 
                    groupValue: _letter, 
                    onChanged: (Letter? value){
                      setState(() {
                        _letter = value;
                      });
                    },
                  ),
                  SizedBox(height: responsive.hp(1),),
                  ElevatedButtons(label: "Siguiente", screen: Form3Screen1.name), 
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}

