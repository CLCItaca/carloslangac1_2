import 'package:carloslangac1_2/config/utils/Idioma.dart';
import 'package:carloslangac1_2/locale_bloc/locale_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildLanguageSwitch(
  BuildContext context,
  ThemeData theme,
  LocaleState state,
) {
  return TextButton(
    onPressed: () {
      context.read<LocaleBloc>().add(
        ChangeIdioma(
          state.idiomaElegido == Idioma.spanish 
          ? Idioma.english
          : Idioma.spanish
        )
      );
    },
    child: RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "ES",
          style: TextStyle(color: state.idiomaElegido == Idioma.spanish 
            ? Colors.black
            : Colors.grey,
          )
        ),
        const TextSpan(
          text: " | ",
        ),
        TextSpan(
          text: "EN",
          style: TextStyle(color: state.idiomaElegido == Idioma.english 
            ? Colors.black
            : Colors.grey,
        )
      )
      ])
    ),
  );
}