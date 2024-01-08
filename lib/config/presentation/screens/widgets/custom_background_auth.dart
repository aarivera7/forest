import 'package:flutter/material.dart';
import 'package:socio_bosques/config/responsive.dart';


class BackgroundAuth extends StatelessWidget {
  final String title;
  
  const BackgroundAuth({
    super.key, required this.title,

  });


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset("assets/images/background.png", fit: BoxFit.cover,),
        ),
        Container(
          width: responsive.wp(100),
          height: responsive.hp(100),
          color: Colors.black.withOpacity(0.6)
        ),
        Container(
          width: responsive.wp(90),
          height: responsive.hp(75),
          decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.65),
          borderRadius: BorderRadius.circular(responsive.ip(3))
          ),
        ),
      
        Positioned(
          top: responsive.hp(20),
          left: responsive.hp(6),
          child: Text(
            title, style: TextStyle(
            color: const Color(0xffC9D94E),
            fontSize: responsive.ip(2.5),
            fontWeight: FontWeight.bold
          ),),
        ),
        
      ],
    );
  }
}