import 'package:flutter/material.dart';
import 'package:socio_bosques/config/responsive.dart';

class TextFormField1 extends StatefulWidget {
  const TextFormField1({
    super.key,
    required this.label,
    required this.hintText, 
    this.controller,
  });
  final TextEditingController? controller;
  final String label;
  final String hintText;

  @override
  State<TextFormField1> createState() => _TextFormField1State();
}

class _TextFormField1State extends State<TextFormField1> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.wp(4.5), 
            vertical: responsive.hp(0.5)
          ),
          child: Text(widget.label, style: TextStyle(
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
            controller: widget.controller,
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
              hintText: widget.hintText,
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
