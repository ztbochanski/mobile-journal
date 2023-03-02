import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  static String routeName = '/welcome';

  const Welcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome! To start writing, tap the + button'),
      ),
    );
  }
}
