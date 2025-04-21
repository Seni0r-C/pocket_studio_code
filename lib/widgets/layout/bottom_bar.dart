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
      BottomNavigationBarItem(icon: Icon(Icons.terminal), label: 'Terminal'),
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
                      selectedIndex == 2
                          ? Colors.white
                          : Colors.grey, // Color del borde
                  width: 2, // Grosor del borde
                ),
                borderRadius: BorderRadius.circular(6), // Bordes redondeados
              ),
            ),

            Text(
              '$tabCount', // Asegúrate de definir esta variable (ej: 3)
              style: TextStyle(
                color: selectedIndex == 2 ? Colors.white : Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        label: 'Pestañas',
      ),
    ],
  );
}
