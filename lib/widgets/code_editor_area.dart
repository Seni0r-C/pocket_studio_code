import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:highlight/languages/dart.dart';

const String _initialCode = '''
void main() {
  print('Hello, Flutter Code Editor!');
}
''';
CodeController _controller = CodeController(text: _initialCode, language: dart);

class CodeEditorArea extends StatelessWidget {
  const CodeEditorArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CodeTheme(
        data: CodeThemeData(styles: draculaTheme),
        child: CodeField(
          controller: _controller,
          expands: true,
          minLines: null,
          maxLines: null,
          textStyle: const TextStyle(fontFamily: 'SourceCodePro'),
        ),
      ),
    );
  }
}
