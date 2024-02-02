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

const List<HomeItem> homeItemsAdmin = [
  HomeItem(
    image: 'assets/images/mapa.jpg',
    title: 'MAPAS',
    route: ''
  ),

  HomeItem(
    image: 'assets/images/formulario.jpg',
    title: 'FORMULARIO',
    route: '/form_center'
  ),
  HomeItem(
    image: 'assets/images/reportes.png',
    title: 'REPORTES',
    route: '/reportes'
  ),
];
const List<HomeItem> homeItemsUser = [
  HomeItem(
    image: 'assets/images/mapa.jpg',
    title: 'MAPAS',
    route: ''
  ),

  HomeItem(
    image: 'assets/images/formulario.jpg',
    title: 'FORMULARIO',
    route: '/form_center'
  ),
 
];