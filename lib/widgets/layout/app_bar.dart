import 'package:flutter/material.dart';

AppBar appBar(int notificationCount, void Function() saveCode) {
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
    leading: IconButton(
      icon: Badge.count(
        count: notificationCount,
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
        onPressed: saveCode,
        tooltip: 'Guardar',
      ),
    ],
  );
}
