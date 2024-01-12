import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/responsive.dart';

enum UseForestal { plantacionesProduccion, agroforestal, regeneracion, reforestacionProteccion, formacionesPioneras }

class Form1Screen1 extends StatefulWidget {
  static const String name = 'form1.1'; 
  const Form1Screen1({super.key});

  @override
  State<Form1Screen1> createState() => _Form1Screen1State();
}

class _Form1Screen1State extends State<Form1Screen1> {
  UseForestal? _useForestal = UseForestal.plantacionesProduccion;	

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
                  RadioListTile(
                    title: Text("Plantaciones: (Producción)"),
                    value: UseForestal.plantacionesProduccion,
                    groupValue: _useForestal, 
                    onChanged: (UseForestal? value) {
                      setState(() {
                        _useForestal = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Agroforestal"),
                    value: UseForestal.agroforestal, 
                    groupValue: _useForestal, 
                    onChanged: (UseForestal? value) {
                      setState(() {
                        _useForestal = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Regeneración"),
                    value: UseForestal.regeneracion, 
                    groupValue: _useForestal, 
                    onChanged: (UseForestal? value) {
                      setState(() {
                        _useForestal = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Reforestación (Protección)"),
                    value: UseForestal.reforestacionProteccion, 
                    groupValue: _useForestal, 
                    onChanged: (UseForestal? value) {
                      setState(() {
                        _useForestal = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Formaciones Pioneras"),
                    value: UseForestal.formacionesPioneras, 
                    groupValue: _useForestal, 
                    onChanged: (UseForestal? value) {
                      setState(() {
                        _useForestal = value;
                      });
                    },
                  ),
                  ElevatedButtons(label: "Finalizar", screen: HomeScreen.name),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
