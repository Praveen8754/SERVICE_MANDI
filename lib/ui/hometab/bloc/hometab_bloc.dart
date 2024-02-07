import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hometab_event.dart';
part 'hometab_state.dart';

class HometabBloc extends Bloc<HometabEvent, HometabState> {
  HometabBloc() : super(HometabState(true, 0)) {
    on<ButtonPressed>(_buttonPressed);
  }

  FutureOr<void> _buttonPressed(event, Emitter<HometabState> emit) {
    emit(HometabState(true, event.buttonIndex));
  }
}

class OrdertabBloc extends Bloc<OrdertabEvent, OrdertabState>{
  final List<String> allItems;
  OrdertabBloc(this.allItems): super(OrdertabState()){
    on<FilterItems> (_filterItems);
  }











  FutureOr<void> _filterItems(event, Emitter<dynamic> emit) {
    List<String> filteredItems = allItems;
    if(event.filterText ==null){
      emit(FilteredItems(filteredItems));
    }
    else {
      List<String> filteredItems = allItems
          .where((item) =>
          item.toLowerCase().contains(event.filterText.toLowerCase()))
          .toList();
      emit(FilteredItems(filteredItems));
    }
  }
}
