import 'package:go_router/go_router.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_1_screen.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_2_1_screen.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_2_2_screen.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_2_screen.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_3_1_screen.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_3_2_screen.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_3_screen.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_4_screen.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_5_screen.dart';
import 'package:socio_bosques/config/presentation/screens/forms/form_6_screen.dart';
import 'package:socio_bosques/config/presentation/screens/home/home_form_center.dart';
import 'package:socio_bosques/config/presentation/screens/resportes/reportes_screen.dart';
import 'package:socio_bosques/config/presentation/screens/screens.dart';



//* GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    

    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/signup',
      name: SignupScreen.name,
      builder: (context, state) => const SignupScreen(),
    ),

    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/form_center',
      name: FormCenterScreen.name,
      builder: (context, state) => const FormCenterScreen(),
    ),

    GoRoute(
      path:'/form1',
      name: Form1Screen.name,
      builder: (context, state) => const Form1Screen(),
    ),


    GoRoute(
      path:'/form2',
      name: Form2Screen.name,
      builder: (context, state) => const Form2Screen(),
    ),

    GoRoute(
      path:'/form2_1',
      name: Form2Screen1.name,
      builder: (context, state) => const Form2Screen1(),
    ),

    GoRoute(
      path:'/form2_2',
      name: Form2Screen2.name,
      builder: (context, state) => const Form2Screen2(),
    ),

    GoRoute(
      path:'/form3',
      name: Form3Screen.name,
      builder: (context, state) => const Form3Screen(),
    ),

    GoRoute(
      path:'/form3_1',
      name: Form3Screen1.name,
      builder: (context, state) => const Form3Screen1(),
    ),

    GoRoute(
      path:'/form3_2',
      name: Form3Screen2.name,
      builder: (context, state) => const Form3Screen2(),
    ),

    GoRoute(
      path:'/form4',
      name: Form4Screen.name,
      builder: (context, state) => const Form4Screen(),
    ),

    GoRoute(
      path:'/form5',
      name: Form5Screen.name,
      builder: (context, state) => const Form5Screen(),
    ),
    
    GoRoute(
      path:'/form6',
      name: Form6Screen.name,
      builder: (context, state) => const Form6Screen(),
    ),

    GoRoute(
      path:'/reportes',
      name: ReportesScreen.name,
      builder: (context, state) => const ReportesScreen(),
    ),
  ],
);