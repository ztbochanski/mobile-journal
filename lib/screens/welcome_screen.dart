import 'package:flutter/material.dart';

import '../components/drawer.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = '/welcome';
  final bool isDarkMode;
  final ValueChanged<bool> onDarkModeToggle;

  const WelcomeScreen({
    Key? key,
    required this.isDarkMode,
    required this.onDarkModeToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      drawer: AppDrawer(
        isDarkMode: isDarkMode,
        onDarkModeToggle: onDarkModeToggle,
      ),
      body: const Center(
        child: Text('Welcome! To start writing, tap the + button'),
      ),
    );
  }
}
