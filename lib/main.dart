import 'package:flutter/material.dart';
import 'package:flutter_movies/core/routing/routes_generation_config.dart';
import 'package:flutter_movies/core/services/services_lacator.dart';

void main() {
  ServicesLacator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: RoutesGenerationConfig.goRoute);
  }
}
