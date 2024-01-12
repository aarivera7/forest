class FormCenterItem {
  final String label;
  final String route;

  const FormCenterItem({
    required this.label,
    required this.route,
  });
}

const List<FormCenterItem> formCenterItems = [
  FormCenterItem(
    label: 'Programa Nacional de Restauración Forestal ',
    route: '/form1'
  ),

  FormCenterItem(
    label: 'Proyecto Socio Bosque',
    route: '/form3'
  ),

  FormCenterItem(
    label: 'Sistema Nacional de Control Forestal',
    route: ''
  ),
];