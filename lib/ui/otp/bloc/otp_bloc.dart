import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<MobileNumberChanged>(_mobileNumberChanged);
  }











  FutureOr<void> _mobileNumberChanged(MobileNumberChanged event, Emitter<OtpState> emit) {
    RegExp regex = RegExp(r'^[0-9]{10}$');

    if (regex.hasMatch(event.mobileNumber)) {
      emit( MobileNumberValid());
    } else {
      emit( MobileNumberInvalid());
    }
  }
}
