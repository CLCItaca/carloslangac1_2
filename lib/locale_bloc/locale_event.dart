part of 'locale_bloc.dart';

sealed class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

class ChangeIdioma extends LocaleEvent {
  final Idioma idiomaElegido;

  const ChangeIdioma(this.idiomaElegido);

  @override
  List<Object> get props => [idiomaElegido];
}