part of 'otpfetch_bloc.dart';

@immutable
abstract class OtpfetchState {}

class OtpfetchInitial extends OtpfetchState {}

class LoadingState extends OtpfetchState {}

class OtpValid extends OtpfetchState {}

class OtpInvalid extends OtpfetchState {}
