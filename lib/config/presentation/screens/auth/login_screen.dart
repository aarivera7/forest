import 'package:flutter/material.dart';
import 'package:socio_bosques/config/presentation/screens/auth/signup_screen.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_background_auth.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_buttoms_auth.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_form.dart';
import 'package:socio_bosques/config/responsive.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen'; 
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: Stack(
        children: [
          BackgroundAuth(title: "INGRESAR"),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.wp(12.5)
            ),
            child: SizedBox(
              height: responsive.hp(100),
              child: Column(
                children: [
                  SizedBox(height: responsive.hp(35),),
                  const _LoginForm(),
                  SizedBox(height: responsive.hp(3),),
                  ElevatedButtons(label: "INGRESAR", screen: HomeScreen.name),
                  SizedBox(height: responsive.hp(2),),
                  TextButtomsAuth(label: "Registrarse", screen: SignupScreen.name)
                ]
              ),
            )
          )
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
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
            label: "Ingresa tu Correo electrónico", 
            icon: Icons.email_rounded, 
            isPassword: false,
            title: "Correo electrónico",
          ),
          SizedBox(height: responsive.hp(2),),
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

