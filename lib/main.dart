import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0XFF00081B),
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              fontSize: 18,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF00081B),
              textStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          scaffoldBackgroundColor: const Color(0XFFCED4DA)),
      home: const HomePage(),
    );
  }
}
