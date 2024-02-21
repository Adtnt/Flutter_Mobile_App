import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_project/common/constants/languages.dart';
import 'package:flutter_project/domain/entities/language_entity.dart';
import 'dart:ui';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageLoaded(Locale(Languages.languages[0].code))) {
    on<LanguageEvent>((event, emit) {
      if (event is ToggleLanguageEvent) {
        emit(LanguageLoaded(Locale(event.language.code)));
      }
    });
  }
}