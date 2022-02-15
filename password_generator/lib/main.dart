import 'package:flutter/material.dart';
import 'package:password_generator/pages/generator.dart';
import 'package:password_generator/styles.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Generator',
      theme: ThemeData(
        primaryColor: Styles.kPrimary,
      ),
      home: const GeneratorView(),
    );
  }
}
