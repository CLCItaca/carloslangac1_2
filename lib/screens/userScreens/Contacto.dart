import 'package:carloslangac1_2/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Contacto extends StatefulWidget {
  const Contacto({super.key});

  @override
  State<Contacto> createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 198, 255),
        title: Text(l10n.contactanos)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l10n.telefono + ': 247 63 14 75')
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('E-mail: 0399clang@e-itaca.es')
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l10n.web + ': www.clanga.es')
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l10n.ubi + ': https://maps.app.goo.gl/JszQBn8EC4b42yjY9')
              ],
            )
          ],
        )
      ),
    );
  }
}