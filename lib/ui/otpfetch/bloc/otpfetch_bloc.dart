import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otpfetch_event.dart';
part 'otpfetch_state.dart';

class OtpfetchBloc extends Bloc<OtpfetchEvent, OtpfetchState> {
  OtpfetchBloc() : super(OtpfetchInitial()) {
    on<OTPChanged>(_otpChanged);
  }

  FutureOr<void> _otpChanged(OTPChanged event, Emitter<OtpfetchState> emit) {
    RegExp regex = RegExp(r'^[0-9]{10}$');

    if (regex.hasMatch(event.otp)) {
      emit( OtpValid());
    } else {
      emit( OtpInvalid());
    }
  }
}
