import 'package:finetrashapp/models/shop.dart';
import 'package:finetrashapp/pages/cart_page.dart';
import 'package:finetrashapp/pages/home_page.dart';
import 'package:finetrashapp/pages/intro_page.dart';
import 'package:finetrashapp/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/intro': (context) => const IntroPage(),
        '/home': (context) => const HomePage(),
        '/keranjang': (context) => const Keranjang(),
      },
    );
  }
}
