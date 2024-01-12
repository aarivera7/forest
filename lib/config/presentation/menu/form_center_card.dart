class FormCenterItem {
  final String label;
  final String route;
  final List<String> menuOptions;

  const FormCenterItem({
    required this.label,
    required this.route,
    required this.menuOptions
  });
}

const List<FormCenterItem> formCenterItems = [
  FormCenterItem(
    label: 'Programa Nacional de Restauración Forestal ',
    route: '/form1',
    menuOptions: ['Ficha de campo para evaluación de predios', 'Ficha para registro de víveros'],
  ),

  FormCenterItem(
    label: 'Proyecto Socio Bosque',
    route: '/form3',
    menuOptions: ['Formulario de Monitoreo Ambiental', 'Formulario de Postulación'],
  ),

  FormCenterItem(
    label: 'Sistema Nacional de Control Forestal',
    route: '',
    menuOptions: ['Plan de aprovechamiento forestal', 'Acta de retención de productos forestales y vida silvestre'],
  ),
];