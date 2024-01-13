class FormCenterItem {
  final String label;
  final List<String> routes;
  final List<String> menuOptions;

  const FormCenterItem({
    required this.label,
    required this.routes,
    required this.menuOptions
  });
}

const List<FormCenterItem> formCenterItems = [
  FormCenterItem(
    label: 'Programa Nacional de Restauración Forestal ',
    routes: ['/form1', '/form2'],
    menuOptions: ['Ficha de campo para evaluación de predios', 'Ficha para registro de víveros'],
  ),

  FormCenterItem(
    label: 'Proyecto Socio Bosque',
    routes: ['/form3', '/form4'],
    menuOptions: ['Formulario de Monitoreo Ambiental', 'Formulario de Postulación'],
  ),

  FormCenterItem(
    label: 'Sistema Nacional de Control Forestal',
    routes: ['/form5', '/form6'],
    menuOptions: ['Plan de aprovechamiento forestal', 'Acta de retención de productos forestales y vida silvestre'],
  ),
];