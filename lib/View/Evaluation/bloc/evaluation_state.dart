part of 'evaluation_bloc.dart';

abstract class EvaluationState extends Equatable {
  const EvaluationState();

  @override
  List<Object> get props => [];
}

class EvaluationInitial extends EvaluationState {}

class OnTapSuccess extends EvaluationState {
  final int? onTapIndex;
  const OnTapSuccess({required this.onTapIndex});

  @override
  List<Object> get props => [onTapIndex!];
}

class RatingSuccess extends EvaluationState {
  final double? rating;
  const RatingSuccess({required this.rating});

  @override
  List<Object> get props => [rating!];
}
