import 'package:flutter/material.dart';

Drawer sideBar(
  BuildContext context,
  selectedSidebarIndex,
  void Function(int) handleSidebarItemTap,
) {
  // Listas de iconos, títulos y contenidos para el Drawer
  final List<IconData> icons = [
    Icons.file_copy_outlined,
    Icons.search,
    Icons.timeline,
    Icons.bug_report,
    Icons.extension,
  ];

  final List<String> titles = [
    'Explorador',
    'Buscar',
    'Control de código fuente',
    'Ejecución y depuración',
    'Extensiones',
  ];

  final List<Widget> contents = const [
    Padding(
      padding: EdgeInsets.all(16),
      child: Text('Contenido de Explorador', style: TextStyle(fontSize: 18)),
    ),
    Padding(
      padding: EdgeInsets.all(16),
      child: Text('Contenido de Búsqueda', style: TextStyle(fontSize: 18)),
    ),
    Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Contenido de Control de código',
        style: TextStyle(fontSize: 18),
      ),
    ),
    Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Contenido de Ejecución y depuración',
        style: TextStyle(fontSize: 18),
      ),
    ),
    Padding(
      padding: EdgeInsets.all(16),
      child: Text('Contenido de Extensiones', style: TextStyle(fontSize: 18)),
    ),
  ];
  return Drawer(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(0),
        bottomRight: Radius.circular(0),
      ),
    ),
    width: MediaQuery.of(context).size.width * 0.9,
    child: SafeArea(
      child: Row(
        children: [
          // 1. Columna de iconos
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ...List.generate(icons.length, (index) {
                return Tooltip(
                  message: titles[index],
                  child: IconButton(
                    icon: Icon(
                      icons[index],
                      color:
                          selectedSidebarIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : null,
                    ),
                    onPressed: () => handleSidebarItemTap(index),
                  ),
                );
              }),
              // 2. Ocupa todo el espacio disponible intermedio
              const Spacer(),

              Tooltip(
                message: 'Cuentas',
                child: IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    // acción de cuenta
                  },
                ),
              ),

              Tooltip(
                message: 'Administrar',
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // acción de configuración
                  },
                ),
              ),
              Container(margin: const EdgeInsets.only(bottom: 8)),
            ],
          ),

          // 2. Separador vertical
          const VerticalDivider(width: 1),

          // 3. Contenido dinámico
          Expanded(
            child: Column(
              children: [Center(child: contents[selectedSidebarIndex])],
            ),
          ),
        ],
      ),
    ),
  );
}
