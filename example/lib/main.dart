import 'package:flutter/material.dart';
import 'package:persian_type_effect/persian_type_effect.dart';

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
      home: const SimpleExample(exampleText: 'خوش آمدید.')
    );
  }
}

class SimpleExample extends StatelessWidget {
  final String exampleText;
  const SimpleExample({super.key, required this.exampleText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PersianTypeEffect(text: exampleText,duration:const Duration(seconds: 10),),
      ),
    );
  }
}