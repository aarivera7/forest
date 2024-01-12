import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/presentation/screens/auth/firebase_auth/firebase_auth_services.dart';
import 'package:socio_bosques/config/presentation/screens/auth/login_screen.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_background_auth.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_text_buttoms_auth.dart';
import 'package:socio_bosques/config/presentation/screens/widgets/custom_login_text_form.dart';
import 'package:socio_bosques/config/responsive.dart';

class SignupScreen extends StatefulWidget {
  static const String name = 'signup_screen'; 
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  
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



class _SignUpForm extends StatefulWidget {
  const _SignUpForm({
    super.key,
  });

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}
final FirebaseAuthService _auth = FirebaseAuthService();

class _SignUpFormState extends State<_SignUpForm> {
  TextEditingController _nameAndLastnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameAndLastnameController.dispose();
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
            controller: _nameAndLastnameController,
            label: "Ingresa tus Nombres y Apellidos", 
            icon: Icons.person_rounded, 
            isPassword: false,
            title: "Nombres y Apellidos",
          ),
          SizedBox(height: responsive.hp(1),),
           LoginTextFormField(
            controller: _emailController ,
            label: "Ingresa tu Correo electrónico", 
            icon: Icons.email_rounded, 
            isPassword: false,
            title: "Correo electrónico",
          ),
          SizedBox(height: responsive.hp(1),),
           LoginTextFormField(
            controller: _passwordController,
            label: "Ingresa tu Contraseña", 
            icon: Icons.lock_rounded, 
            isPassword: true,
            suffixIcon: Icons.remove_red_eye_rounded,
            title: "Contraseña",
          ),
          SizedBox(height: responsive.hp(2),),
          ElevatedButton(
            onPressed: signUp,
            child: Text("Registrar", style: TextStyle(
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
          ),
        ]
      )
    );
  }
  
void signUp ()async{
  String nameAndLastname = _nameAndLastnameController.text;
  String email = _emailController.text;
  String password = _passwordController.text;

  User? user =await _auth.signUpwithEmailAndPassword(email, password);

  if(user != null){
    print('Usuario creado');
    context.pushReplacementNamed(LoginScreen.name);
  }else{
    print('error al crear usuario');
  }

}
}