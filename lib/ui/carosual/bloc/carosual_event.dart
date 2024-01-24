part of 'carosual_bloc.dart';

abstract class CarosualEvent {

}
class PageChangedEvent extends CarosualEvent {
  final int pageIndex;

  PageChangedEvent(this.pageIndex);
}




