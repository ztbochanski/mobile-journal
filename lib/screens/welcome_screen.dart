import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = '/welcome';

  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Welcome! To start writing, tap the + button'),
    );
  }
}
