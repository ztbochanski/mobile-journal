import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final String welcomeMessage;
  final String title;
  static String routeName = '/';

  const Welcome({Key? key, required this.welcomeMessage, required this.title})
      : super(key: key);

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
