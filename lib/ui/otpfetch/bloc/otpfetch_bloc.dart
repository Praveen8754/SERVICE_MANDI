import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otpfetch_event.dart';
part 'otpfetch_state.dart';

class OtpfetchBloc extends Bloc<OtpfetchEvent, OtpfetchState> {
  OtpfetchBloc() : super(OtpfetchInitial()) {
    on<OtpfetchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
