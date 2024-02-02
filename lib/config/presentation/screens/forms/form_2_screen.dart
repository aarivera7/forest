import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:location/location.dart' as loc;
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

enum Tipo { vivero, jardin }

class Form2Screen extends StatefulWidget {
  static const String name = 'form2'; 
  const Form2Screen({super.key});

  @override
  State<Form2Screen> createState() => _Form3ScreenState();
}

class _Form3ScreenState extends State<Form2Screen> {
  File? image;
   late String url;
  Future pickImage() async{

  try {
  final image = await ImagePicker().pickImage(source: ImageSource.camera);
  
  if(image == null) return;
  final firebaseStorageRef = FirebaseStorage.instance.ref().child('images/FichaRegistroVi/${DateTime.now()} .png');

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
  String? _tipo = 'vivero';
  TextEditingController nombreUMAController = TextEditingController(text: "");
  TextEditingController claveRController = TextEditingController(text: "");
  TextEditingController institucionAsController = TextEditingController(text: "");
  TextEditingController propietarioRSocController = TextEditingController(text: "");
  TextEditingController titularRepController = TextEditingController(text: "");
  TextEditingController telefonoPropController = TextEditingController(text: "");
  TextEditingController faxPropController = TextEditingController(text: "");
  TextEditingController correoPropController = TextEditingController(text: "");
  TextEditingController rfcPropController = TextEditingController(text: "");
  TextEditingController propRespoTecController = TextEditingController(text: "");
  TextEditingController titularTecController = TextEditingController(text: "");
  TextEditingController telefonoTecController = TextEditingController(text: "");
  TextEditingController faxTecController = TextEditingController(text: "");
  TextEditingController correoTecController = TextEditingController(text: "");
  TextEditingController rfcTecController = TextEditingController(text: "");
  

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
                  Text("Tipo: ", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.ip(2),
                        )
                      ),
                  RadioListTile(
                    title: Text("Vívero"),
                    value: 'vivero', 
                    groupValue: _tipo, 
                    onChanged: ( value) {
                      setState(() {
                        _tipo = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Jardín botánico"),
                    value: 'jardin', 
                    groupValue: _tipo, 
                    onChanged: (value){
                      setState(() {
                        _tipo = value;
                      });
                    },
                  ),
                  TextFormField1(label: "Nombre de la UMA", hintText: "Ingrese el nombre la UMA", controller: nombreUMAController ,),
                  TextFormField1(label: "Clave de registro", hintText: "Ingrese su clave", controller: claveRController,),
                  TextFormField1(label: "Institución Y/0 asociasión", hintText: "Ingrese su la institución", controller:  institucionAsController,),
                  SizedBox(height: responsive.hp(1),),
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
                  TextFormField1(label: "Propietario o razón social", hintText: "Ingrese el Propietario o razón social", controller: propietarioRSocController,),
                  TextFormField1(label: "Titular o representante legal", hintText: "Ingrese Representante legal", controller: titularRepController,),
                  TextFormField1(label: "Teléfono", hintText: "Ingrese Teléfono", controller: telefonoPropController,),
                  TextFormField1(label: "Fax", hintText: "Ingrese Fax", controller: faxPropController,),
                  TextFormField1(label: "Correo electrónico", hintText: "Ingrese Correo Electrónico", controller: correoPropController,),
                  TextFormField1(label: "RFC", hintText: "Ingrese RFC", controller: rfcPropController,),
                  SizedBox(height: responsive.hp(2),),
                  Text('Responsable tecnico', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff467302),
                    fontSize: responsive.ip(3.3),
                  ),
                ),
                  SizedBox(height: responsive.hp(2),),
                ]
              )
            ),
        
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField1(label: "Propietario o razón social", hintText: "Ingrese el Propietario o razón social", controller: propRespoTecController,),
                  TextFormField1(label: "Titular o representante legal", hintText: "Ingrese Representante legal", controller: titularTecController,),
                  TextFormField1(label: "Teléfono", hintText: "Ingrese Teléfono", controller: telefonoTecController,),
                  TextFormField1(label: "Fax", hintText: "Ingrese Fax", controller: faxTecController,),
                  TextFormField1(label: "Correo electrónico", hintText: "Ingrese Correo Electrónico", controller: correoTecController,),
                  TextFormField1(label: "RFC", hintText: "Ingrese RFC", controller: rfcTecController,),
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
                      await addFormFichaViveros("Ficha de registro de viveros", _tipo ,nombreUMAController.text, claveRController.text,
                      institucionAsController.text, propietarioRSocController.text, titularRepController.text, telefonoPropController.text, faxPropController.text, correoPropController.text,
                      rfcPropController.text, propRespoTecController.text,titularTecController.text,telefonoTecController.text,faxTecController.text,
                      correoTecController.text, rfcTecController.text, _center.latitude, _center.longitude, url, DateTime.now()).then((_) {
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
                ],
              )
              ) 
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}

