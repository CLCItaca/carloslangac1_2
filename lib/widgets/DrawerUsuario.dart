import 'package:carloslangac1_2/l10n/app_localizations.dart';
import 'package:carloslangac1_2/locale_bloc/locale_bloc.dart';
import 'package:carloslangac1_2/widgets/buildLanguageSwitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerUsuario extends StatelessWidget {
  final List<VoidCallback> onTap;
  const DrawerUsuario({super.key, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              tileColor: Colors.blue,
              textColor: Colors.white,
              title: Text(l10n.menu, textAlign: TextAlign.center,)
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(l10n.cerrarSesion),
              onTap: onTap[0],
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(l10n.perfil),
              onTap: onTap[1],
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(l10n.salir),
              onTap: onTap[2]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<LocaleBloc, LocaleState>(
                  builder: (context, state) => buildLanguageSwitch(
                    context,
                    Theme.of(context),
                    state,
                  ))
              ],
            )
          ]
        ),
      );
  }
}