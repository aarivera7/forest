class HomeItem {
  final String image;
  final String title;

  const HomeItem({
    required this.image,
    required this.title,
  });
}

const List<HomeItem> homeItems = [
  HomeItem(
    image: 'assets/images/mapa.jpg',
    title: 'MAPAS',
  ),

  HomeItem(
    image: 'assets/images/formulario.jpg',
    title: 'FORMULARIO',
  ),

  HomeItem(
    image: 'assets/images/sincronizacion.jpg',
    title: 'SINCRONIZACION',
  ),
];