import 'package:flutter/material.dart';

class ShortcutPanel extends StatelessWidget {
  const ShortcutPanel({super.key, required this.tabCount});

  final int tabCount;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // siempre 8 px por encima del teclado
      bottom: 8,
      right: 8,
      child: Material(
        // para la sombra y la interacción “ripple”
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        color: Colors.blueGrey.withOpacity(0.8),
        child: Padding(
          // relleno interior
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => print('Buscar'),
                icon: const Icon(Icons.search, color: Colors.white),
                tooltip: 'Buscar',
              ),
              IconButton(
                onPressed: () => print('Terminal'),
                icon: const Icon(Icons.terminal, color: Colors.white),
                tooltip: 'Terminal',
              ),
              const SizedBox(height: 12),
              Stack(
                alignment: Alignment.center,
                children: [
                  // contorno redondeado
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Text(
                    '$tabCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
