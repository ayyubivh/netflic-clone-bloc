import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/colors/colors.dart';
import 'presentation/mainpage/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: kBlack),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: bgColor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: kWhite),
            bodySmall: TextStyle(color: kWhite),
          )),
      home: ScreenMainPage(),
    );
  }
}
