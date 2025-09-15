import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movies/core/routing/routes_generation_config.dart';
import 'package:flutter_movies/core/services/services_lacator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLacator().init();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: RoutesGenerationConfig.goRoute);
  }
}
