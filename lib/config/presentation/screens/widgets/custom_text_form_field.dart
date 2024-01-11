import 'package:flutter/material.dart';
import 'package:socio_bosques/config/responsive.dart';

class TextFormField1 extends StatelessWidget {
  const TextFormField1({
    super.key,
    required this.label,
    required this.hintText,
  });

  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.wp(4.1), 
            vertical: responsive.hp(0.5)
          ),
          child: Text(label, style: TextStyle(
            color: Colors.black,
            fontSize: responsive.ip(2),
          )),
        ),
        SizedBox(height: responsive.hp(0.1),),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.wp(4),
            vertical: responsive.hp(0.5)
          ),
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
              fontSize: responsive.ip(1.2)
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(responsive.ip(1)),
                borderSide: const BorderSide(color: Color(0xff102601))
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(responsive.ip(1)),
                borderSide: const BorderSide(color: Color(0xff102601))
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(responsive.ip(1)),
                borderSide: const BorderSide(color: Color(0xff102601))
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(responsive.ip(1)),
                borderSide: const BorderSide(color: Color(0xff102601))
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: responsive.ip(1.6)
              ),
            ),
                    
          ),
        ),
      ],
    );
  }
}
