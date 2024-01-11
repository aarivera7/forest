class HomeItem {
  final String image;
  final String title;
  final String route;

  const HomeItem({
    required this.image,
    required this.title,
    required this.route,
  });
}

const List<HomeItem> homeItems = [
  HomeItem(
    image: 'assets/images/mapa.jpg',
    title: 'MAPAS',
    route: ''
  ),

  HomeItem(
    image: 'assets/images/formulario.jpg',
    title: 'FORMULARIO',
    route: '/form1'
  ),

  HomeItem(
    image: 'assets/images/sincronizacion.jpg',
    title: 'SINCRONIZACION',
    route: ''
  ),
];