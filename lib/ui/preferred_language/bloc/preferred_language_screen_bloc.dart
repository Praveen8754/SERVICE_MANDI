import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'preferred_language_screen_event.dart';
part 'preferred_language_screen_state.dart';

class PreferredLanguageScreenBloc extends Bloc<PreferredLanguageScreenEvent, PreferredLanguageScreenState> {
  PreferredLanguageScreenBloc() : super(PreferredLanguageScreenInitial()) {
    on<PreferredLanguageScreenEvent>(_preferredlanguage);
  }

  FutureOr<void> _preferredlanguage(PreferredLanguageScreenEvent event, Emitter<PreferredLanguageScreenState> emit) {
  }
}
