import 'package:flutter/material.dart';

class JournalScaffold extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const JournalScaffold({
    Key? key,
    required this.isDarkMode,
    required this.onToggleTheme,
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
        endDrawer: RightDrawer(
          isDarkMode: isDarkMode,
          onToggleTheme: onToggleTheme,
        ),
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
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const RightDrawer(
      {Key? key, required this.isDarkMode, required this.onToggleTheme})
      : super(key: key);

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
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: isDarkMode,
            onChanged: (value) {
              onToggleTheme();
            },
          ),
        ],
      ),
    );
  }
}

// class RightDrawer extends StatefulWidget {

//   const RightDrawer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<RightDrawer> createState() => _RightDrawerState();
// }

// class _RightDrawerState extends State<RightDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor,
//             ),
//             child: const Text('Settings'),
//           ),
//           const Text('Dark Mode'),
//           Switch(
//             value: widget.isDarkMode,
//             onChanged: (value) {
//               // Calling parent Widget's method from child
//               widget.onToggleTheme;
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
