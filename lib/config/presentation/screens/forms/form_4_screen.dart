import 'package:flutter/material.dart';
import 'package:socio_bosques/config/controller/forms/form_4_controller.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:socio_bosques/config/responsive.dart';

class Form4Screen extends StatefulWidget {
  static const String name = 'form4'; 
  const Form4Screen({super.key});

  @override
  State<Form4Screen> createState() => _Form4ScreenState();
}

class _Form4ScreenState extends State<Form4Screen> {
  final form4Controller = Form4Controller();

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
                  TextFormField1(label: "Razón social de la empresa", hintText: "Ingrese la Razon Social ",controller: form4Controller.razonEmpController,),
                  TextFormField1(label: "Representante legal", hintText: "Ingrese el representante Legal",controller: form4Controller.representController),
                  TextFormField1(label: "Ruc", hintText: "Ingrese el Ruc",controller: form4Controller.rucController),
                  TextFormField1(label: "Ciudad", hintText: "Ingrese la Cuidad",controller: form4Controller.ciudadController),
                  TextFormField1(label: "Dirección", hintText: "Ingrese la Dirección", controller: form4Controller.direcController),
                  TextFormField1(label: "Contacto", hintText: "Ingrese su Contacto", controller: form4Controller.contactoController),
                  TextFormField1(label: "Número de empleados", hintText: "Ingrese número de empleados", controller: form4Controller.numeroEmpleController),
                  TextFormField1(label: "Categoría en la que participa", hintText: "Ingrese la Categoría",controller: form4Controller.categoriaController),
                  TextFormField1(label: "Productos y servicios", hintText: "Ingrese productos y servicios",controller: form4Controller.productosController),
                  TextFormField1(label: "Años de funcionamiento", hintText: "Ingrese los años de funcionamiento", controller: form4Controller.anosFuncionamientoController),
                  TextFormField1(label: "Misión", hintText: "Ingrese la Misión", controller: form4Controller.misionController),
                  TextFormField1(label: "Vision", hintText: "Ingrese la visión", controller: form4Controller.visionController),
                  SizedBox(height: responsive.hp(1),),
                  ElevatedButton(
                    onPressed: () => form4Controller.subirDatos(context),
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

