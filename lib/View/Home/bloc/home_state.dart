part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class OnTapLoading extends HomeState {}

class OnTapSuccess extends HomeState {
  final int? onTapIndex;
  final String? coursesName;
  const OnTapSuccess({this.onTapIndex, this.coursesName});

  @override
  List<Object> get props => [onTapIndex!, coursesName!];
}
