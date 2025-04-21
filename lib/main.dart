import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/dracula.dart';

void main() {
  runApp(const CodeEditorApp());
}

class CodeEditorApp extends StatelessWidget {
  const CodeEditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode(); // ← FocusNode añadido

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: draculaTheme['root']?.backgroundColor ?? Colors.black,
      appBar: AppBar(
        title: const Text('File Name.dart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveCode,
            tooltip: 'Save',
          ),
        ],
      ),
      body: Column(
        children: [
          // 2. Expanded para llenar todo el espacio
          Expanded(
            child: CodeTheme(
              data: CodeThemeData(styles: draculaTheme),
              child: CodeField(
                controller: _controller,
                focusNode: _focusNode,
                // 3. Expansión nativa y scroll interno
                expands: true,
                minLines: null,
                maxLines: null,
                textStyle: const TextStyle(fontFamily: 'SourceCodePro'),
              ),
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
