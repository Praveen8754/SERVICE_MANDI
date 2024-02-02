part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

class MobileNumberValid extends OtpState {}

class MobileNumberInvalid extends OtpState {}
