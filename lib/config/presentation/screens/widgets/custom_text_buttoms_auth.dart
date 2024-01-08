import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/responsive.dart';

class TextButtomsAuth extends StatelessWidget {
  final String label;
  final String screen;
  const TextButtomsAuth({
    super.key, required this.label, required this.screen
  });


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return TextButton(onPressed: (){
      context.pushReplacementNamed(screen);
    }, child: Text(label, style: TextStyle(
      color: Colors.white,
      fontSize: responsive.ip(1.5),
    ),));
  }
}
