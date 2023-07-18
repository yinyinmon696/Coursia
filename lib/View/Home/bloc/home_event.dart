part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends HomeEvent {
  final int? onTapIndex;
  final String? courseName;
  const OnTapEvent({this.onTapIndex, this.courseName});
}
