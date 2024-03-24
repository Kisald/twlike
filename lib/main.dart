import 'package:flutter/material.dart';
import 'body.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const color = const Color(0xFFFCE68E);
    return MaterialApp(
        title: "Twitter-Like",
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: color,
            brightness: Brightness.dark,
          ),
          //Configuration du thème des textes
          fontFamily: "Pacifico",
          textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
            // TRY THIS: Change one of the GoogleFonts
            //           to "lato", "poppins", or "lora".
            //           The title uses "titleLarge"
            //           and the middle text uses "bodyMedium".
            titleLarge: const TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
            bodyMedium: const TextStyle(),
            displaySmall: const TextStyle(),
          ),
        ),
        home: body());
  }
}
