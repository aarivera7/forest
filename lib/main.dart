import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socio_bosques/config/router/app_router.dart';
import 'package:socio_bosques/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
        title: 'Viva el Flutter',
        routerConfig: appRouter,
    );
  }
}



