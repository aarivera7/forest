import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:socio_bosques/config/responsive.dart';

enum TipoOrg { natural, juridica, privada, publica }
enum Calidad { propietario, arrendatario, otro }
enum Aprovechamiento { domestica, persistente, unico, arbolesAislados, caidos, muertos, tala, poda,
   transplante, bosqueNatural, bosqueSombrio, otro }

class Form5Screen extends StatefulWidget {
  static const String name = 'form5'; 
  const Form5Screen({super.key});

  @override
  State<Form5Screen> createState() => _Form5ScreenState();
}

class _Form5ScreenState extends State<Form5Screen> {
  TipoOrg? _tipo = TipoOrg.natural;
  Calidad? _calidad = Calidad.propietario;
  Aprovechamiento? _aprovechamiento = Aprovechamiento.domestica;

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
                Text('Datos del Solicitante', 
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
                  Text("Tipo Organización: ", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.ip(2),
                        )
                      ),
                  RadioListTile(
                    title: Text("Persona Natural"),
                    value: TipoOrg.natural, 
                    groupValue: _tipo, 
                    onChanged: (TipoOrg? value) {
                      setState(() {
                        _tipo = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Persona Jurídica"),
                    value: TipoOrg.juridica, 
                    groupValue: _tipo, 
                    onChanged: (TipoOrg? value){
                      setState(() {
                        _tipo = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Publica"),
                    value: TipoOrg.publica, 
                    groupValue: _tipo, 
                    onChanged: (TipoOrg? value){
                      setState(() {
                        _tipo = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Privada"),
                    value: TipoOrg.privada, 
                    groupValue: _tipo, 
                    onChanged: (TipoOrg? value){
                      setState(() {
                        _tipo = value;
                      });
                    },
                  ),
                  TextFormField1(label: "Nombre o Razon Social:", hintText: "Ingrese Razon Social",),
                  TextFormField1(label: "Cédula/RUC: ", hintText: "Ingrese la cédula o RUC",),
                  TextFormField1(label: "Representante Legal:", hintText: "Ingrese el nombre del Representante Legal",),
                  TextFormField1(label: "Cédula del Representante Legal", hintText: "Ingrese la cedula del Representante Legal",),
                  TextFormField1(label: "Dirección:", hintText: "Ingrese la Dirección",),
                  TextFormField1(label: "Cuidad: ", hintText: "Ingrese la Cuidad",),
                  TextFormField1(label: "Teléfono:", hintText: "Ingrese el Teléfono",),
                  TextFormField1(label: "E-mail", hintText: "Ingrese el E-mail",),

                  Text("Calidad en que actúa: ", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.ip(2),
                        )
                      ),
                  RadioListTile(
                    title: Text("Propietario"),
                    value: Calidad.propietario,
                    groupValue: _calidad, 
                    onChanged: (Calidad? value) {
                      setState(() {
                        _calidad = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Arrendatario"),
                    value: Calidad.arrendatario,
                    groupValue: _calidad, 
                    onChanged: (Calidad? value){
                      setState(() {
                        _calidad = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Otro"),
                    value: Calidad.otro, 
                    groupValue: _calidad, 
                    onChanged: (Calidad? value){
                      setState(() {
                        _calidad = value;
                      });
                    },
                  ),

                  Text('Información General', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff467302),
                    fontSize: responsive.ip(3.3),
                    ),
                  ),

                  Text("Tipo de aprovechamiento: ", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.ip(2),
                        )
                      ),
                  RadioListTile(
                    title: Text("Doméstico"),
                    value: Aprovechamiento.domestica,
                    groupValue: _aprovechamiento, 
                    onChanged: (Aprovechamiento? value) {
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Único"),
                    value: Aprovechamiento.unico,
                    groupValue: _aprovechamiento, 
                    onChanged: (Aprovechamiento? value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Persistente"),
                    value: Aprovechamiento.persistente, 
                    groupValue: _aprovechamiento, 
                    onChanged: (Aprovechamiento? value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Arboles Aislados"),
                    value: Aprovechamiento.arbolesAislados, 
                    groupValue: _aprovechamiento, 
                    onChanged: (Aprovechamiento? value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Caídos"),
                    value: Aprovechamiento.caidos, 
                    groupValue: _aprovechamiento, 
                    onChanged: (Aprovechamiento? value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Muertos"),
                    value: Aprovechamiento.muertos, 
                    groupValue: _aprovechamiento, 
                    onChanged: (Aprovechamiento? value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Tala"),
                    value: Aprovechamiento.tala, 
                    groupValue: _aprovechamiento, 
                    onChanged: (Aprovechamiento? value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Bosque Natural"),
                    value: Aprovechamiento.bosqueNatural, 
                    groupValue: _aprovechamiento, 
                    onChanged: (Aprovechamiento? value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Bosque Sombrío"),
                    value: Aprovechamiento.bosqueSombrio, 
                    groupValue: _aprovechamiento, 
                    onChanged: (Aprovechamiento? value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Otro"),
                    value: Aprovechamiento.otro, 
                    groupValue: _aprovechamiento, 
                    onChanged: (Aprovechamiento? value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),

                  TextFormField1(label: "Especies", hintText: "Ingrese las Especies",),
                  TextFormField1(label: "No. Arboles", hintText: "Ingrese N°",),
                  TextFormField1(label: "Volumen:", hintText: "Ingrese la Volumen",),
                  TextFormField1(label: "Especie a Aprovechar(Nombre Común)", hintText: "Ingrese Nombre Común",),
                  TextFormField1(label: "Nombre Cientifico", hintText: "Ingrese el Nombre Cientifico",),
                  TextFormField1(label: "Costo del Proyecto ", hintText: "Ingrese Costo del Proyecto",),

                  Text('Información del Predio', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff467302),
                    fontSize: responsive.ip(3.3),
                    ),
                  ),
                  TextFormField1(label: "Nombre:", hintText: "Ingrese el Nombre",),
                  TextFormField1(label: "Matricula Inmobiliaria ", hintText: "Ingrese  la Inmobilaria",),
                  TextFormField1(label: "Escritura Publica No:", hintText: "Ingrese  Escriturá Publica",),
                  TextFormField1(label: "Fecha", hintText: "Ingrese Fecha",),
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

