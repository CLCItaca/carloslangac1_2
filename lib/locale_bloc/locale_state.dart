part of 'locale_bloc.dart';


sealed class LocaleState extends Equatable {
  final Idioma idiomaElegido;
  const LocaleState({Idioma? idioma}) : idiomaElegido = idioma ?? Idioma.spanish;

  @override
  List<Object> get props => [idiomaElegido];
}

final class LocaleInitial extends LocaleState{}

final class LocaleChanged extends LocaleState{
  const LocaleChanged({super.idioma});
} 