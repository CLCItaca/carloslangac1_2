import 'package:carloslangac1_2/l10n/app_localizations.dart';
import 'package:carloslangac1_2/l10n/app_localizations_en.dart';
import 'package:flutter/material.dart';
import 'package:carloslangac1_2/models/User.dart';
class PerfilUsuario extends StatefulWidget {
  final User usuario;
  const PerfilUsuario({super.key, required this.usuario});

  @override
  State<PerfilUsuario> createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  String trata(){
    final l10n = AppLocalizations.of(context)!;
    switch (widget.usuario.getTrata()){
      case 0:
        return l10n.bienvenido + ' ' + l10n.sr + widget.usuario.getNombre();
      
      case 2:
        return l10n.bienvenido + ' ' + l10n.sra + widget.usuario.getNombre();

      default:
        return l10n.bienvenido + ' ' + widget.usuario.getNombre();
    }
  }

  String Edad(){
    final l10n = AppLocalizations.of(context)!;
    return l10n.edad + ": " + widget.usuario.getEdad().toString();
  }

  String nacimiento(){
    final l10n = AppLocalizations.of(context)!;
    return l10n.nacimiento + ":  "+ widget.usuario.getNacimiento();
  }
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 198, 255),
        title: Text(
          trata(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 150, right: 150, top: 20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 237, 255),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.cyan
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: const EdgeInsets.all(10)),
                        Text(
                          Edad(),
                          style: TextStyle(color: Color.fromARGB(255, 22, 104, 255)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: const EdgeInsets.all(10)),
                        Text(
                          nacimiento(),
                          style: TextStyle(color: Color.fromARGB(255, 22, 104, 255))
                        ),
                      ],
                    )
                  ],
                ),
              )
            )
          ]
        ),

        ),
      );
  }
}