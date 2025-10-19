import 'package:flutter/material.dart';

void main() {
  runApp(const VisceralApp());
}

class VisceralApp extends StatelessWidget {
  const VisceralApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visceral',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Visceral Coaching App',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
