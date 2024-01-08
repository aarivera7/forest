import 'package:go_router/go_router.dart';
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

  ],
);