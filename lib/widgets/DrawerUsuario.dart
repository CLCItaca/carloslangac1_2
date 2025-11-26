import 'package:flutter/material.dart';

class DrawerUsuario extends StatelessWidget {
  final List<VoidCallback> onTap;
  const DrawerUsuario({super.key, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              tileColor: Colors.blue,
              textColor: Colors.white,
              title: const Text('Menú', textAlign: TextAlign.center,)
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Pantalla Principal'),
              onTap: onTap[0],
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: onTap[1],
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: const Text('Salir'),
              onTap: onTap[2]
              )
          ]
        )
      );
  }
}