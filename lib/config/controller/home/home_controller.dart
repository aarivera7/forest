import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeController {
  void seleccion(BuildContext context, String route){
    context.push(route);
  }
}