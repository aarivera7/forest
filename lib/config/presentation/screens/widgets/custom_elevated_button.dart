import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/responsive.dart';

class ElevatedButtons extends StatelessWidget {
  final String label;
  final String screen;
  const ElevatedButtons({
    super.key, required this.label, required this.screen,
  });


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return ElevatedButton(
      onPressed: (){
        context.pushReplacementNamed(screen);
      },
      child: Text(label, style: TextStyle(
        color: Colors.white,
        fontSize: responsive.ip(1.2),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xff467302)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(responsive.ip(1))
        )),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
          horizontal: responsive.wp(8),
          vertical: responsive.hp(0.75)
        ))
      )
    );
  }
}