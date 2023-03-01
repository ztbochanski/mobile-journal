import 'package:flutter/material.dart';

class JournalScaffold extends StatelessWidget {
  const JournalScaffold({
    Key? key,
    required this.title,
    this.floatingActionButton,
    this.child,
  }) : super(key: key);

  final String title;
  final Widget? floatingActionButton;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: floatingActionButton,
      body: child
    );
  }
}
