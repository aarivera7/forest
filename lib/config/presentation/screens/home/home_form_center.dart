import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/controller/home/home_form_center_controller.dart';
import 'package:socio_bosques/config/presentation/menu/form_center_card.dart';
import 'package:socio_bosques/config/responsive.dart';

class FormCenterScreen extends StatelessWidget {
  static const String name = 'form_center_screen';
  const FormCenterScreen({super.key});

  // Arranca la vista de registro
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white),
        backgroundColor: const Color(0xff102601),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: responsive.ip(6), vertical: responsive.ip(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: formCenterItems.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: responsive.hp(4)),
                itemBuilder: (BuildContext context, int index) {
                  return _FormCard(
                    title: formCenterItems[index].label,
                    routes: formCenterItems[index].routes,
                    menuOptions: formCenterItems[index].menuOptions,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  final String title;
  final List<String> routes;
  final List<String> menuOptions;

  const _FormCard({
    required this.title,
    required this.routes,
    required this.menuOptions,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final HomeFormCenterController homeFormCenterController =
    HomeFormCenterController();

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            context.push(routes[0]);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(responsive.ip(.5)),
            ),
            elevation: 0,
            padding: EdgeInsets.symmetric(
              horizontal: responsive.ip(2),
              vertical: responsive.ip(1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: responsive.ip(1.8),
                  ),
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                offset: Offset(0, responsive.ip(2)),
                itemBuilder: (BuildContext context) {
                  return menuOptions.map((String option) {
                    return PopupMenuItem<String>(
                      value: option,
                      child: Text(
                        option,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList();
                },
                // 
                onSelected: (String selectedOption) {
                  
                  print("Seleccionaste: $selectedOption");

                 
                  switch (selectedOption) {
                    case 'Ficha de campo para evaluación de predios':
                    case 'Formulario de Monitoreo Ambiental':
                    case 'Plan de aprovechamiento forestal':
                      homeFormCenterController.seleccion(context, routes[0]);
                      break;
                    
                    case 'Ficha para registro de víveros':
                    case 'Formulario de Postulación':
                    case 'Acta de retención de productos forestales y vida silvestre':
                      homeFormCenterController.seleccion(context, routes[1]);
                      break;
            
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
