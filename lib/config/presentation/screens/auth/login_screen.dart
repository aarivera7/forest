import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_auth/firebase_auth_services.dart';
import 'package:socio_bosques/config/presentation/screens/auth/signup_screen.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_background_auth.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_buttoms_auth.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_login_text_form.dart';
import 'package:socio_bosques/config/responsive.dart';

class LoginScreen extends StatefulWidget {
  static const String name = 'login_screen'; 
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

class _LoginForm extends StatefulWidget {
  const _LoginForm({
    super.key,
  });

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

  final FirebaseAuthService _auth = FirebaseAuthService();
class _LoginFormState extends State<_LoginForm> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           LoginTextFormField(
            controller: _emailController,
            label: "Ingresa tu Correo electrónico", 
            icon: Icons.email_rounded, 
            isPassword: false,
            title: "Correo electrónico",
          ),
          SizedBox(height: responsive.hp(2),),
           LoginTextFormField(
            controller: _passwordController,
            label: "Ingresa tu Contraseña", 
            icon: Icons.lock_rounded, 
            isPassword: true,
            suffixIcon: Icons.remove_red_eye_rounded,
            title: "Contraseña",
          ),
          SizedBox(height: responsive.hp(3),),
          ElevatedButton(
            onPressed: _Login,
            child: Text('INGRESAR', style: TextStyle(
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
          )
        ]
      )
    );
  }
  void _Login ()async{
 
  String email = _emailController.text;
  String password = _passwordController.text;

  User? user =await _auth.signInwithEmailAndPassword(email, password);

  if(user != null){
    context.pushReplacementNamed(HomeScreen.name);
  }else{
    print('error al logear usuario');
  }

}
}

