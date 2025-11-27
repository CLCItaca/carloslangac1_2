import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carloslangac1_2/config/utils/Idioma.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState>{
  LocaleBloc() : super(LocaleInitial()){
    on<ChangeIdioma>(onChangeIdioma);
  }

  onChangeIdioma(ChangeIdioma event, Emitter<LocaleState> emit){
    emit(LocaleChanged(idioma: event.idiomaElegido));
  }
}