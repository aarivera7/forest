import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/presentation/menu/form_center_card.dart';
import 'package:socio_bosques/config/presentation/menu/home_card.dart';
import 'package:socio_bosques/config/responsive.dart';

class FormCenterScreen extends StatelessWidget {
  static const String name = 'form_center_screen'; 
  const FormCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white,),
        backgroundColor: const Color(0xff102601),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.ip(6),
          vertical: responsive.ip(24)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: ListView.separated(
              itemCount: homeItems.length, 
              separatorBuilder: (context, index) => SizedBox(height: responsive.hp(4),),
              itemBuilder: (BuildContext context, int index) {
              return _FormCard(title: formCenterItems[index].label, route: formCenterItems[index].route,);
            }),)
        ]),
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  final String title;
  final String route;
  const _FormCard({
    required this.title, required this.route
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return ElevatedButton(
      onPressed: (){
        context.push(route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(responsive.ip(.5))
        ),
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: responsive.ip(2),
          vertical: responsive.ip(1)
        )
      ),
      child:  Text(title, textAlign: TextAlign.center, style: TextStyle(
        color: Colors.white,
        fontSize: responsive.ip(1.8),
        ),
      ),
    );

    /*return Align(
      
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
    );*/
  }
}