
import 'package:flutter/material.dart';
import 'package:socio_bosques/config/responsive.dart';

class BtonImage extends StatelessWidget {
  final VoidCallback onClick;
  const BtonImage({
    super.key, required this.onClick,

  });

 
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: responsive.wp(10)),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xff467302)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(responsive.ip(1))
          )),
        ),
        child: Row(
          children: [
            Icon(Icons.camera, color: Colors.white, size: responsive.ip(2.8)),
            SizedBox(width: responsive.wp(1.6),),
            Text('Capturar Imagen', style: TextStyle(color: Colors.white) )
          ],
        ),
        onPressed: onClick,
      ),
    );
  }
}