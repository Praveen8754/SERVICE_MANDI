import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hometab_event.dart';

part 'hometab_state.dart';

class HometabBloc extends Bloc<HometabEvent, HometabState> {
  HometabBloc() : super(HometabInitial()) {
    on<Supportclicked>(_supportclicked);
    on<Notificationclicked>(_notificationclicked);
    on<Drawermenuclicked>(_drawermenuclicked);
    on<ServiceandRepairs>(_serviceandRepairs);
    on<ServiceBooking>(_serviceBooking);
    on<Wheelalignment>(_wheelalignment);
    on<PowerSolutions>(_powerSolutions);
    on<TowingService>(_towingService);
    on<ReferforLoans>(_referforLoans);
    on<VehicleInsurance>(_vehicleInsurance);
    on<MyVehicles>(_myVehicles);
    on<BunkLocator>(_bunkLocator);
  }

  FutureOr<void> _supportclicked(
      Supportclicked event, Emitter<HometabState> emit) {}

  FutureOr<void> _notificationclicked(
      Notificationclicked event, Emitter<HometabState> emit) {}

  FutureOr<void> _drawermenuclicked(
      Drawermenuclicked event, Emitter<HometabState> emit) {}

  FutureOr<void> _serviceandRepairs(
      ServiceandRepairs event, Emitter<HometabState> emit) {}

  FutureOr<void> _serviceBooking(
      ServiceBooking event, Emitter<HometabState> emit) {}

  FutureOr<void> _wheelalignment(
      Wheelalignment event, Emitter<HometabState> emit) {}

  FutureOr<void> _powerSolutions(
      PowerSolutions event, Emitter<HometabState> emit) {}

  FutureOr<void> _towingService(
      TowingService event, Emitter<HometabState> emit) {}

  FutureOr<void> _referforLoans(
      ReferforLoans event, Emitter<HometabState> emit) {}

  FutureOr<void> _vehicleInsurance(
      VehicleInsurance event, Emitter<HometabState> emit) {}

  FutureOr<void> _myVehicles(MyVehicles event, Emitter<HometabState> emit) {}

  FutureOr<void> _bunkLocator(BunkLocator event, Emitter<HometabState> emit) {}
}
