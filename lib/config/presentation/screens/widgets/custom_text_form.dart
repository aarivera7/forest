import 'package:flutter/material.dart';
import 'package:socio_bosques/config/responsive.dart';


class LoginTextFormField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isPassword;
  final IconData? suffixIcon;
  final String title;
  
  const LoginTextFormField({
    super.key, required this.label, required this.icon, required this.isPassword, this.suffixIcon, required this.title,
  });


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(
          color: Colors.white,
          fontSize: responsive.ip(1.8),
        )),
        SizedBox(height: responsive.hp(1),),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.wp(1),
            vertical: responsive.hp(1)
          ),
          child: TextFormField(
            obscureText: isPassword,
            style: TextStyle(
              color: Colors.white,
              fontSize: responsive.ip(1.2)
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(responsive.ip(2)),
                borderSide: const BorderSide(color: Color(0xff102601))
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(responsive.ip(2)),
                borderSide: const BorderSide(color: Color(0xff102601))
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(responsive.ip(2)),
                borderSide: const BorderSide(color: Color(0xff102601))
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(responsive.ip(2)),
                borderSide: const BorderSide(color: Color(0xff102601))
              ),
              /*contentPadding: EdgeInsets.symmetric(
                horizontal: responsive.wp(1.2),
                vertical: responsive.hp(1.2),
              ),*/
              fillColor: const Color(0xff102601),
              filled: true,
              prefixIcon: Icon(
                icon,
                size: responsive.ip(2.5),
                color: Colors.white
              ),
              hintText: label,
              suffixIcon: Icon(
                suffixIcon,
                size: responsive.ip(2.5),
                color: Colors.white
              ),
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: responsive.ip(1.6)
              ),
            ),
                    
          ),
        ),
      ],
    );
  }
}