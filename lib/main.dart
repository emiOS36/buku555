import 'package:buku_555_v2/screen/main_navigation_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Buku555());
}

class Buku555 extends StatelessWidget {
  const Buku555({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xFFf6f6f6),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFFf6f6f6)),
      ),

      home: MainNavigationScreen(),
    );
  }
}
