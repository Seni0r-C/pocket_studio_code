import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/dracula.dart';

class CodeEditorField extends StatefulWidget {
  const CodeEditorField({super.key});

  @override
  CodeEditorFieldState createState() => CodeEditorFieldState();
}

class CodeEditorFieldState extends State<CodeEditorField> {
  late CodeController _controller;
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode(); // ← FocusNode añadido
  int _selectedIndex = 0;
  int tabCount = 6;
  @override
  void initState() {
    super.initState();
    _controller = CodeController(text: _initialCode, language: dart);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

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
      backgroundColor: draculaTheme['root']?.backgroundColor ?? Colors.black,
      appBar: AppBar(
        title: Tooltip(
          message: 'Nombre del archivo abierto.dart',
          waitDuration: Duration(milliseconds: 500),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Nombre del archivo abierto.dart',
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        leading: IconButton(
          icon: Badge.count(
            count: tabCount,
            offset: const Offset(4, 12),
            child: const Icon(Icons.menu),
          ),
          onPressed: () {},
          tooltip: 'Opciones',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () {},
            tooltip: 'Retroceder',
          ),
          IconButton(
            icon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.1416), // π radianes = 180 grados
              child: const Icon(Icons.undo),
            ),
            onPressed: () {},
            tooltip: 'Avanzar',
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveCode,
            tooltip: 'Guardar',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CodeTheme(
              data: CodeThemeData(styles: draculaTheme),
              child: CodeField(
                controller: _controller,
                focusNode: _focusNode,
                expands: true,
                minLines: null,
                maxLines: null,
                textStyle: const TextStyle(fontFamily: 'SourceCodePro'),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[500],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.terminal),
            label: 'Terminal',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Sin relleno
                    border: Border.all(
                      color:
                          _selectedIndex == 2
                              ? Colors.white
                              : Colors.grey, // Color del borde
                      width: 2, // Grosor del borde
                    ),
                    borderRadius: BorderRadius.circular(
                      6,
                    ), // Bordes redondeados
                  ),
                ),

                Text(
                  '$tabCount', // Asegúrate de definir esta variable (ej: 3)
                  style: TextStyle(
                    color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            label: 'Pestañas',
          ),
        ],
      ),
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

const String _initialCode = '''
void main() {
  print('Hello, Flutter Code Editor!');
}
''';
