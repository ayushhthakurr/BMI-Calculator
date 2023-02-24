import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // canvasColor: Color.fromRGBO(10, 14, 33, 15),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        // appBarTheme: AppBarTheme(color: Color.fromRGBO(10,14, 33, 5),),
        appBarTheme: const AppBarTheme(color: Color(0xFF0A0E21)),
       
      ),
      home: const InputPage(),
    );
  }
}



