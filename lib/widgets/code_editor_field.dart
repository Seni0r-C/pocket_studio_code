import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:pocket_studio_code/widgets/code_editor_area.dart';
import 'package:pocket_studio_code/widgets/layout/app_bar.dart';
import 'package:pocket_studio_code/widgets/layout/bottom_bar.dart';
import 'package:pocket_studio_code/widgets/layout/shortcut_panel.dart';
import 'package:pocket_studio_code/widgets/layout/side_bar.dart';

class CodeEditorField extends StatefulWidget {
  const CodeEditorField({super.key});

  @override
  CodeEditorFieldState createState() => CodeEditorFieldState();
}

class CodeEditorFieldState extends State<CodeEditorField> {
  int _selectedIndex = 0;
  int _selectedSidebarIndex = 0;
  int tabCount = 6;
  int notificationCount = 2;

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

  void handleSidebarItemTap(int index) {
    setState(() {
      _selectedSidebarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideBar(context, _selectedSidebarIndex, handleSidebarItemTap),
      backgroundColor: draculaTheme['root']?.backgroundColor ?? Colors.black,
      appBar: appBar(notificationCount, _saveCode, context),
      body: Stack(
        children: [
          Column(children: const [CodeEditorArea()]),
          ShortcutPanel(tabCount: tabCount),
        ],
      ),
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
