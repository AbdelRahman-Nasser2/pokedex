import 'package:flutter/material.dart';
import 'package:pokedex/modules/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await HTTP.getData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
