part of 'otpfetch_bloc.dart';

@immutable
abstract class OtpfetchEvent {}

class OTPChanged extends OtpfetchEvent {
  final String otp;
  OTPChanged(this.otp);
}