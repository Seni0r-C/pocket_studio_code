import 'package:flutter/material.dart';

AppBar appBar(
  int notificationCount,
  void Function() saveCode,
  BuildContext context,
) {
  return AppBar(
    title: Tooltip(
      message: 'Nombre del archivo abierto.dart',
      waitDuration: Duration(milliseconds: 500),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Nombre del archivo abierto.dart',
          style: TextStyle(color: Colors.white, fontSize: 16),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ),
    leading: Builder(
      builder: (context) {
        return IconButton(
          icon: Badge.count(
            count: notificationCount,
            offset: const Offset(4, 12),
            child: const Icon(Icons.menu),
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
          tooltip: 'Opciones',
        );
      },
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.undo),
        onPressed: () {},
        tooltip: 'Retroceder',
      ),
      IconButton(
        icon: const Icon(Icons.redo),
        onPressed: () {},
        tooltip: 'Avanzar',
      ),
      IconButton(
        icon: const Icon(Icons.save),
        onPressed: saveCode,
        tooltip: 'Guardar',
      ),
    ],
  );
}
