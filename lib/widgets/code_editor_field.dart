import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:pocket_studio_code/widgets/code_editor_area.dart';
import 'package:pocket_studio_code/widgets/layout/app_bar.dart';
import 'package:pocket_studio_code/widgets/layout/bottom_bar.dart';

class CodeEditorField extends StatefulWidget {
  const CodeEditorField({super.key});

  @override
  CodeEditorFieldState createState() => CodeEditorFieldState();
}

class CodeEditorFieldState extends State<CodeEditorField> {
  int _selectedIndex = 0;
  int tabCount = 6;
  int notificationCount = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Simula la acción para cada botón
    switch (index) {
      case 0:
        print("Botón 0 presionado");
        break;
      case 1:
        print("Botón 1 presionado");
        break;
      case 2:
        print("Botón 2 presionado");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      backgroundColor: draculaTheme['root']?.backgroundColor ?? Colors.black,
      appBar: appBar(notificationCount, _saveCode, context),
      body: Column(children: [CodeEditorArea()]),
      bottomNavigationBar: bottomBar(tabCount, _onItemTapped, _selectedIndex),
    );
  }

  void _saveCode() {
    // Implement saving logic, e.g. write to file or share
    // final codeText = _controller.text;
    // For demo, just show snackbar
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Code saved!')));
  }
}
