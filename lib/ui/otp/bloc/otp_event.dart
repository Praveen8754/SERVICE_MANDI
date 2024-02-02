part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}
class MobileNumberChanged extends OtpEvent {
  final String mobileNumber;
  MobileNumberChanged(this.mobileNumber);
}