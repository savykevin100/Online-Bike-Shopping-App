import 'package:flutter/material.dart';

import 'package:statistique_progress/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent),
          canvasColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
