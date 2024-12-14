import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        brightness: Brightness.dark, // Dark theme for the entire app
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Color(0xFF121212), // Dark background color
        hintColor: Colors.white, // White accents
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
