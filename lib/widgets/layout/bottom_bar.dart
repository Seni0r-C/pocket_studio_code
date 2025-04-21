import 'package:flutter/material.dart';

BottomNavigationBar bottomBar(
  int tabCount,
  void Function(int) onItemTapped,
  int selectedIndex,
) {
  return BottomNavigationBar(
    backgroundColor: Colors.grey[900],
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey[500],
    currentIndex: selectedIndex,
    onTap: onItemTapped,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Información'),
      BottomNavigationBarItem(
        icon: Badge.count(count: 0, child: Icon(Icons.notifications)),
        label: 'Notificaciones',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.tune), label: 'Configuración'),
    ],
  );
}
