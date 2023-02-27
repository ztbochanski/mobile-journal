import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final String title = 'Welcome';
  final String welcomeMessage = 'Welcome! To start writing, tap the + button';
  static String routeName = '/welcome';

  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(welcomeMessage),
      ),
    );
  }
}
