import 'package:flutter/material.dart';
import 'package:pocket_studio_code/widgets/code_editor_field.dart';

void main() {
  runApp(const CodeEditorApp());
}

class CodeEditorApp extends StatelessWidget {
  const CodeEditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CodeEditorField(),
    );
  }
}
