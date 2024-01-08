import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/auth/login_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_background_auth.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_buttoms_auth.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form.dart';
import 'package:socio_bosques/config/responsive.dart';

class SignupScreen extends StatelessWidget {
  static const String name = 'signup_screen'; 
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      body: Stack(
        children: [
          BackgroundAuth(title: "REGISTRARSE"),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.wp(12.5)
            ),
            child: SizedBox(
              height: responsive.hp(100),
              child: Column(
                children: [
                  SizedBox(height: responsive.hp(30),),
                  const _SignUpForm(),
                  SizedBox(height: responsive.hp(2),),
                  ElevatedButtons(label: "REGISTRAR", screen: LoginScreen.name),
                  SizedBox(height: responsive.hp(1),),
                  TextButtomsAuth(label: "Ya tengo cuenta", screen: LoginScreen.name)
                ]
              ),
            )
          )
        ],
      ));
  }
}



class _SignUpForm extends StatelessWidget {
  const _SignUpForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoginTextFormField(
            label: "Ingresa tus Nombres y Apellidos", 
            icon: Icons.person_rounded, 
            isPassword: false,
            title: "Nombres y Apellidos",
          ),
          SizedBox(height: responsive.hp(1),),
          const LoginTextFormField(
            label: "Ingresa tu Correo electrónico", 
            icon: Icons.email_rounded, 
            isPassword: false,
            title: "Correo electrónico",
          ),
          SizedBox(height: responsive.hp(1),),
          const LoginTextFormField(
            label: "Ingresa tu Contraseña", 
            icon: Icons.lock_rounded, 
            isPassword: true,
            suffixIcon: Icons.remove_red_eye_rounded,
            title: "Contraseña",
          ),
        ]
      )
    );
  }
}

