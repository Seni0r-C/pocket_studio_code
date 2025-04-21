import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/dart.dart';

void main() {
  runApp(const CodeEditorApp());
}

class CodeEditorApp extends StatelessWidget {
  const CodeEditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Editor',
      theme: ThemeData.dark(),
      home: const CodeEditorPage(),
    );
  }
}

class CodeEditorPage extends StatefulWidget {
  const CodeEditorPage({super.key});

  @override
  _CodeEditorPageState createState() => _CodeEditorPageState();
}

class _CodeEditorPageState extends State<CodeEditorPage> {
  late CodeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CodeController(text: _initialCode, language: dart);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pocket Studio Code'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveCode,
            tooltip: 'Save',
          ),
        ],
      ),
      body: Row(
        children: [
          // Sidebar: files
          Container(
            width: 200,
            color: Colors.grey[900],
            child: const Center(
              child: Text('Explorer', style: TextStyle(color: Colors.white70)),
            ),
          ),
          // Editor area
          Expanded(
            child: CodeField(
              controller: _controller,
              textStyle: const TextStyle(fontFamily: 'SourceCodePro'),
            ),
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
