import 'package:flutter/material.dart';
import 'package:socio_bosques/config/responsive.dart';

class Form1Screen extends StatelessWidget {
  static const String name = 'form'; 
  const Form1Screen({super.key});
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
          Title(
            color: Colors.black, 
            child: Padding(
              padding: EdgeInsets.all(responsive.ip(2.5)),
              child: 
              Text('Ubicación de predios y datos generales', 
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff467302),
                  fontSize: responsive.ip(3.5),
                ),
              )
            )
          ),

          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.wp(4.1), 
                    vertical: responsive.hp(0.5)
                  ),
                  child: Text('Provincia', style: TextStyle(
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
                      hintText: 'Provincia',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: responsive.ip(1.6)
                      ),
                    ),
                            
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
