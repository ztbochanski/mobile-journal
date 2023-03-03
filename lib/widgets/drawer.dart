import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onDarkModeToggle;

  const AppDrawer({
    Key? key,
    required this.isDarkMode,
    required this.onDarkModeToggle,
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
              value: isDarkMode,
              onChanged: onDarkModeToggle,
            ),
          ),
        ],
      ),
    );
  }
}
