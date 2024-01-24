part of 'splash_bloc.dart';

 class SplashScreenState {}

class SplashInitial extends SplashScreenState {}

class SplashLoading extends SplashScreenState {}

class SplashLoaded extends SplashScreenState {
  late final String targetScreenName;

  SplashLoaded(this.targetScreenName);
}