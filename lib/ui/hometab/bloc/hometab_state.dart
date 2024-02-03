part of 'hometab_bloc.dart';

@immutable
abstract class HometabState {}

class HometabInitial extends HometabState {}

class LoadingState extends HometabState {}
class HomeTabLoaded extends HometabState {
  late final String targetScreenName;

  HomeTabLoaded(this.targetScreenName);
}

