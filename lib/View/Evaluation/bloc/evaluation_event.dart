part of 'evaluation_bloc.dart';

abstract class EvaluationEvent extends Equatable {
  const EvaluationEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends EvaluationEvent {
  final int? onTapIndex;
  const OnTapEvent({required this.onTapIndex});
}

class Rating extends EvaluationEvent {
  final double? rating;
  const Rating({required this.rating});
}
