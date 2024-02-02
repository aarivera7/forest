import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen_admin.dart';
import 'package:socio_bosques/config/controller/forms/form_3_controller.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_bton_image.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:socio_bosques/config/responsive.dart';
import 'package:location/location.dart' as loc;

class Form3Screen extends StatefulWidget {
  static const String name = 'form3'; 
  const Form3Screen({super.key});

  @override
  State<Form3Screen> createState() => _Form3ScreenState();
}

class _Form3ScreenState extends State<Form3Screen> {
  File? image;
  late String url;
  final form3Controller = Form3Controller();

  Future pickImage() async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      
      if(image == null) return;
      final firebaseStorageRef = FirebaseStorage.instance.ref().child('images/FichaPredios/${DateTime.now()} .png');

      await firebaseStorageRef.putFile(File(image.path));

      final urlImage = await firebaseStorageRef.getDownloadURL();
      
      final imageTemporary  = File(image.path);
      setState(()=>this.image = imageTemporary) ;
      setState(()=>url = urlImage) ;
    } on PlatformException catch (e) {
      print('Fallo en la imagen');
    }
  }
  late GoogleMapController mapController;
  LatLng _center = LatLng(0.0, 0.0);
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }
  

  void _onMapCreated(GoogleMapController controller) {
   
    mapController = controller;
  }
   
   
   Future<void> _getCurrentLocation() async {
    final location = loc.Location();
    try {
      var currentLocation = await location.getLocation();
      setState(() {
        _center = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _loading = false;
      });
    } catch (e) {
      print('Error obteniendo la ubicación: $e');
    }
  }
  String? _letter = 'yes';

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
                  TextFormField1(label: "Fecha", hintText: "Ingrese la fecha", controller: form3Controller.fechaController ,),
                  TextFormField1(label: "Área", hintText: "Ingrese el Área", controller: form3Controller.areaController,),
                  TextFormField1(label: "Tipo y diseño", hintText: "Ingrese el tipo o diseño", controller: form3Controller.tipoDisController,),
                  TextFormField1(label: "Propetario", hintText: "Ingrese el propietario", controller: form3Controller.propietarioController,),
                  TextFormField1(label: "Teléfono del propetario", hintText: "Ingrese numero de teléfono", controller: form3Controller.telefonoController,),
                  Text("Carta de compromiso", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.ip(2),
                        )
                      ),
                  RadioListTile(
                    title: Text("Sí"),
                    value: 'yes', 
                    groupValue: _letter, 
                    onChanged: ( value) {
                      setState(() {
                        _letter = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("No"),
                    value: 'no', 
                    groupValue: _letter, 
                    onChanged: (value){
                      setState(() {
                        _letter = value;
                      });
                    },
                  ),
                  SizedBox(height: responsive.hp(1),),
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
                TextFormField1(label: "Nombre de parcela", hintText: "Ingrese Nombre de la Parcela", controller: form3Controller.nombreParcController,),
                TextFormField1(label: "Fecha de monitoreo", hintText: "Ingrese fecha de monitoreo", controller: form3Controller.fechaMoniController ,),
                TextFormField1(label: "Superficie monitoreada", hintText: "Ingrese la superficie", controller: form3Controller.superfMonController,),
                SizedBox(height: responsive.hp(1),),
              ],
            ),
          ),
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
                  TextFormField1(label: "Numero de árbol", hintText: "Ingrese N° de Árbol ", controller: form3Controller.numeroArController ,),
                  TextFormField1(label: "Especie", hintText: "Ingrese la Especie", controller: form3Controller.especieController ,),
                  TextFormField1(label: "Altura", hintText: "Ingrese la Altura", controller: form3Controller.alturaController,),
                  TextFormField1(label: "Diámetro", hintText: "Ingrese la Diámetro", controller: form3Controller.diametroController,),
                  TextFormField1(label: "Diametro de copa en E", hintText: "Ingrese la Diametro de copa", controller: form3Controller.diametroEController ,),
                  TextFormField1(label: "Diametro de copa en N", hintText: "Ingrese la Diametro de Copa N", controller: form3Controller.diametroNController ,),
                  TextFormField1(label: "Estado fitosanitario", hintText: "Ingrese Estado de fitosanitario", controller: form3Controller.estadoFitoController,),
                  TextFormField1(label: "Mantenimiento", hintText: "Ingrese el Mantenimiento", controller: form3Controller.mantenimientoController,),
                  SizedBox(height: responsive.hp(1),), 

                ],
              ),
            ),
                ],
              ),
            ),
             SizedBox(height: responsive.hp(2),),
                  Text('Ubicación',style: TextStyle(fontSize: responsive.ip(2))),
                  SizedBox(height: responsive.hp(2),),
                  SizedBox(
                    width: responsive.wp(75),
                    height: responsive.hp(30),
                    child: _loading
                        ? Center(child: CircularProgressIndicator())
                        : GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: _center,
                              zoom: 15.0,
                            ),
                            markers: {
                              Marker(
                                markerId: MarkerId('currentLocation'),
                                position: _center,
                              ),
                            },
                          ),
                  ),
                  SizedBox(height: responsive.hp(2),),
                  Text('Prueba',style: TextStyle(fontSize: responsive.ip(2))),
                  SizedBox(height: responsive.hp(2),),
                  SizedBox(
                    width: responsive.wp(75),
                    height: responsive.hp(30),
                    child: image != null? Image.file(image!, fit: BoxFit.cover,): Image.asset('assets/images/noImage.jpg', fit: BoxFit.cover,)),
                  SizedBox(height: responsive.hp(3)),
                  BtonImage(onClick: pickImage,),
                  SizedBox(height: responsive.hp(3)),
            ElevatedButton(
                    onPressed: () => form3Controller.subirDatos(context, _letter, _center, url),
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
                  ),
          ]
        ),
      ),
    );
  }
}

