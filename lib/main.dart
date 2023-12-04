import 'package:flutter/material.dart';
import 'package:projeto_nyx/Screens/home_page.dart';
import 'package:projeto_nyx/Screens/landing_page.dart';
import 'package:projeto_nyx/Screens/splash_page.dart';
import 'package:projeto_nyx/Screens/login_page.dart';
import 'package:projeto_nyx/Screens/register_page.dart';
import 'package:projeto_nyx/Screens/Tutorial/tutorial_1.dart';
import 'package:projeto_nyx/Screens/Tutorial/tutorial_2.dart';
import 'package:projeto_nyx/Screens/Tutorial/tutorial_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorObservers: const [],
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/main': (context) => Landing(),
        '/home': (context) => MainPage(),

        '/register': (context) => const RegisterPage(),
        '/tutorial1': (context) => const Tutorial1(),
        '/tutorial2': (context) => const Tutorial2(),
        '/tutorial3': (context) => const Tutorial3(),
      },
    );
  }
}
