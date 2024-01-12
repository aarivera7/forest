import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/presentation/menu/home_card.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_1_screen.dart';
import 'package:socio_bosques/config/responsive.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'router_screen'; 
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white,),
        backgroundColor: const Color(0xff102601),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemCount: homeItems.length, itemBuilder: (BuildContext context, int index) {
            return _HomeCard(title: homeItems[index].title, image: homeItems[index].image, route: homeItems[index].route,);
          }))
          , //TextButton(onPressed: (){ context.pushReplacementNamed(Form1Screen.name);}, child: Text('forms'))
      ]),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final String title;
  final String image;
  final String route;
  const _HomeCard({
    required this.title, required this.image, required this.route
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return InkWell(
      onTap: () => context.push(route),
      child: Align(
        
        alignment: Alignment.center,
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsive.hp(5),),
            Text(title, style: TextStyle(
              color: Color(0xff467302),
              fontSize: responsive.ip(2),
            )),
            SizedBox(height: responsive.hp(2),),
            Container(
              height: responsive.hp(15),
              width: responsive.wp(85),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(responsive.ip(6))
              ),
            ),
          ],
        ),
      ),
    );
  }
}