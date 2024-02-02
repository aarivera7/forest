import 'dart:io';
import 'package:location/location.dart' as loc;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_services/firebase_forms/firebase_forms_services_push.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_bton_image.dart';
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
  File? image;
   late String url;
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
  String? _tipo = 'natural';
  String? _calidad = 'propietario';
  String? _aprovechamiento = 'domestica';
  TextEditingController razonSocController = TextEditingController(text: "");
  TextEditingController cedRucController = TextEditingController(text: "");
  TextEditingController representanteController = TextEditingController(text: "");
  TextEditingController cedRepresentanteController = TextEditingController(text: "");
  TextEditingController direccionEmpController = TextEditingController(text: "");
  TextEditingController ciudadController = TextEditingController(text: "");
  TextEditingController telefonoController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController especiesController = TextEditingController(text: "");
  TextEditingController numArbolesController = TextEditingController(text: "");
  TextEditingController volumController = TextEditingController(text: "");
  TextEditingController especieAprovController = TextEditingController(text: "");
  TextEditingController nombreaCieController = TextEditingController(text: "");
  TextEditingController costoProyectController = TextEditingController(text: "");
  TextEditingController nombrePredController = TextEditingController(text: "");
  TextEditingController matriculaPredController = TextEditingController(text: "");
  TextEditingController escrituraPredController = TextEditingController(text: "");
  TextEditingController fechaPreController = TextEditingController(text: "");

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
                    value: 'natural', 
                    groupValue: _tipo, 
                    onChanged: (value) {
                      setState(() {
                        print(value);
                        _tipo = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Persona Jurídica"),
                    value: 'juridica', 
                    groupValue: _tipo, 
                    onChanged: (value){
                      setState(() {
                        _tipo = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Publica"),
                    value: 'publica', 
                    groupValue: _tipo, 
                    onChanged: (value){
                      setState(() {
                        _tipo = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Privada"),
                    value: 'privada', 
                    groupValue: _tipo, 
                    onChanged: (value){
                      setState(() {
                        _tipo = value;
                      });
                    },
                  ),
                  TextFormField1(label: "Nombre o Razon Social:", hintText: "Ingrese Razon Social", controller: razonSocController,),
                  TextFormField1(label: "Cédula/RUC: ", hintText: "Ingrese la cédula o RUC", controller: cedRucController),
                  TextFormField1(label: "Representante Legal:", hintText: "Ingrese el nombre del Representante Legal",controller: representanteController),
                  TextFormField1(label: "Cédula del Representante Legal", hintText: "Ingrese la cedula del Representante Legal", controller: cedRepresentanteController),
                  TextFormField1(label: "Dirección:", hintText: "Ingrese la Dirección", controller: direccionEmpController),
                  TextFormField1(label: "Cuidad: ", hintText: "Ingrese la Cuidad", controller: ciudadController),
                  TextFormField1(label: "Teléfono:", hintText: "Ingrese el Teléfono", controller: telefonoController),
                  TextFormField1(label: "E-mail", hintText: "Ingrese el E-mail", controller: emailController),

                  Text("Calidad en que actúa: ", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsive.ip(2),
                        )
                      ),
                  RadioListTile(
                    title: Text("Propietario"),
                    value: 'propietario',
                    groupValue: _calidad, 
                    onChanged: (value) {
                      setState(() {
                        _calidad = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Arrendatario"),
                    value: 'arrendatario',
                    groupValue: _calidad, 
                    onChanged: (value){
                      setState(() {
                        _calidad = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Otro"),
                    value: 'otro', 
                    groupValue: _calidad, 
                    onChanged: ( value){
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
                    value: 'domestica',
                    groupValue: _aprovechamiento, 
                    onChanged: (value) {
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Único"),
                    value: 'unico',
                    groupValue: _aprovechamiento, 
                    onChanged: (value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Persistente"),
                    value: 'persistente', 
                    groupValue: _aprovechamiento, 
                    onChanged: (value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Arboles Aislados"),
                    value: 'arboles Aislados', 
                    groupValue: _aprovechamiento, 
                    onChanged: (value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Caídos"),
                    value: 'caidos', 
                    groupValue: _aprovechamiento, 
                    onChanged: (value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Muertos"),
                    value: 'muertos', 
                    groupValue: _aprovechamiento, 
                    onChanged: (value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Tala"),
                    value: 'tala', 
                    groupValue: _aprovechamiento, 
                    onChanged: (value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Bosque Natural"),
                    value: 'bosqueNatural', 
                    groupValue: _aprovechamiento, 
                    onChanged: (value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Bosque Sombrío"),
                    value: 'bosqueSombrio', 
                    groupValue: _aprovechamiento, 
                    onChanged: (value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Otro"),
                    value: 'otro', 
                    groupValue: _aprovechamiento, 
                    onChanged: (value){
                      setState(() {
                        _aprovechamiento = value;
                      });
                    },
                  ),

                  TextFormField1(label: "Especies", hintText: "Ingrese las Especies", controller: especiesController),
                  TextFormField1(label: "No. Arboles", hintText: "Ingrese N°", controller: numArbolesController),
                  TextFormField1(label: "Volumen:", hintText: "Ingrese la Volumen", controller: volumController),
                  TextFormField1(label: "Especie a Aprovechar(Nombre Común)", hintText: "Ingrese Nombre Común", controller: especieAprovController),
                  TextFormField1(label: "Nombre Cientifico", hintText: "Ingrese el Nombre Cientifico", controller: nombreaCieController),
                  TextFormField1(label: "Costo del Proyecto ", hintText: "Ingrese Costo del Proyecto", controller: costoProyectController),

                  Text('Información del Predio', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff467302),
                    fontSize: responsive.ip(3.3),
                    ),
                  ),
                  TextFormField1(label: "Nombre:", hintText: "Ingrese el Nombre", controller: nombrePredController),
                  TextFormField1(label: "Matricula Inmobiliaria ", hintText: "Ingrese  la Inmobilaria", controller: matriculaPredController),
                  TextFormField1(label: "Escritura Publica No:", hintText: "Ingrese  Escriturá Publica", controller: escrituraPredController),
                  TextFormField1(label: "Fecha", hintText: "Ingrese Fecha", controller: fechaPreController),
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
                      await addPlanAprovechamientoForestal("Plan de aprovechamiento forestal" , _tipo, razonSocController.text, cedRucController.text,
                      representanteController.text, cedRepresentanteController.text, direccionEmpController.text, ciudadController.text,telefonoController.text, emailController.text,
                      _calidad, _aprovechamiento, especiesController.text, numArbolesController.text, volumController.text, especieAprovController.text, nombreaCieController.text,
                      costoProyectController.text , nombrePredController.text , matriculaPredController.text , escrituraPredController.text ,
                      fechaPreController.text, _center.latitude, _center.longitude, url,DateTime.now(), ).then((_) {
                      context.pushReplacement('/reportes');
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

