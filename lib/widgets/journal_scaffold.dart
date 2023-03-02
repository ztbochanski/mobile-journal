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
        appBar: AppBar(title: Text(title), actions: const [
          SettingsIcon(),
        ]),
        endDrawer: const RightDrawer(),
        floatingActionButton: floatingActionButton,
        body: child);
  }
}

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}

class RightDrawer extends StatelessWidget {
  const RightDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text('Settings'),
          ),
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
