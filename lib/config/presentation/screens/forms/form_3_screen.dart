import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen_admin.dart';
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
  Future pickImage() async{

  try {
  final image = await ImagePicker().pickImage(source: ImageSource.camera);
  
  if(image == null) return;
  final firebaseStorageRef = FirebaseStorage.instance.ref().child('images/FormMonitoreAmb/${DateTime.now()} .png');

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
  TextEditingController fechaController = TextEditingController(text: "");
  TextEditingController areaController = TextEditingController(text: "");
  TextEditingController tipoDisController = TextEditingController(text: "");
  TextEditingController propietarioController = TextEditingController(text: "");
  TextEditingController telefonoController = TextEditingController(text: "");
  TextEditingController nombreParcController = TextEditingController(text: "");
  TextEditingController fechaMoniController = TextEditingController(text: "");
  TextEditingController superfMonController = TextEditingController(text: "");
  TextEditingController numeroArController = TextEditingController(text: "");
  TextEditingController especieController = TextEditingController(text: "");
  TextEditingController alturaController = TextEditingController(text: "");
  TextEditingController diametroController = TextEditingController(text: "");
  TextEditingController diametroEController = TextEditingController(text: "");
  TextEditingController diametroNController = TextEditingController(text: "");
  TextEditingController estadoFitoController = TextEditingController(text: "");
  TextEditingController mantenimientoController = TextEditingController(text: "");

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
                  TextFormField1(label: "Fecha", hintText: "Ingrese la fecha", controller:fechaController ,),
                  TextFormField1(label: "Área", hintText: "Ingrese el Área", controller: areaController,),
                  TextFormField1(label: "Tipo y diseño", hintText: "Ingrese el tipo o diseño", controller: tipoDisController,),
                  TextFormField1(label: "Propetario", hintText: "Ingrese el propietario", controller: propietarioController,),
                  TextFormField1(label: "Teléfono del propetario", hintText: "Ingrese numero de teléfono", controller: telefonoController,),
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
                TextFormField1(label: "Nombre de parcela", hintText: "Ingrese Nombre de la Parcela", controller: nombreParcController,),
                TextFormField1(label: "Fecha de monitoreo", hintText: "Ingrese fecha de monitoreo", controller:fechaMoniController ,),
                TextFormField1(label: "Superficie monitoreada", hintText: "Ingrese la superficie", controller: superfMonController,),
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
                  TextFormField1(label: "Numero de árbol", hintText: "Ingrese N° de Árbol ", controller:numeroArController ,),
                  TextFormField1(label: "Especie", hintText: "Ingrese la Especie", controller:especieController ,),
                  TextFormField1(label: "Altura", hintText: "Ingrese la Altura", controller: alturaController,),
                  TextFormField1(label: "Diámetro", hintText: "Ingrese la Diámetro", controller: diametroController,),
                  TextFormField1(label: "Diametro de copa en E", hintText: "Ingrese la Diametro de copa", controller:diametroEController ,),
                  TextFormField1(label: "Diametro de copa en N", hintText: "Ingrese la Diametro de Copa N", controller:diametroNController ,),
                  TextFormField1(label: "Estado fitosanitario", hintText: "Ingrese Estado de fitosanitario", controller: estadoFitoController,),
                  TextFormField1(label: "Mantenimiento", hintText: "Ingrese el Mantenimiento", controller: mantenimientoController,),
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
                    onPressed: () async{
                      await addFormMonAmbiental("Formulario de Monitoreo Ambiental" ,fechaController.text, areaController.text,
                      tipoDisController.text, propietarioController.text, telefonoController.text, _letter, nombreParcController.text,fechaMoniController.text, superfMonController.text,
                       numeroArController.text, especieController.text,alturaController.text,diametroController.text,diametroEController.text,diametroNController.text, 
                       estadoFitoController.text, mantenimientoController.text, _center.latitude, _center.longitude, url,DateTime.now()).then((_) {
                      User? user = FirebaseAuth.instance.currentUser;
                        var kk = FirebaseFirestore.instance
                                .collection('users')
                                .doc(user!.uid)
                                .get()
                                .then((DocumentSnapshot documentSnapshot) {
                                  if (documentSnapshot.exists) {
                            if (documentSnapshot.get('rool') == true) {
                              context.pushReplacementNamed(HomeScreenAdmin.name);
                            }else{
                              context.pushReplacementNamed(HomeScreenUser.name);
                            }
                          } else {
                            print('Document does not exist on the database');
                          }
                        });;
                      setState(() {
                      });
                      });
                    },
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

