part of 'multiple_choice_bloc.dart';

abstract class MultipleChoiceState extends Equatable {
  const MultipleChoiceState();

  @override
  List<Object> get props => [];
}

class MultipleChoiceInitial extends MultipleChoiceState {}

class OnTapSuccess extends MultipleChoiceState {
  final int? onTapIndex;
  const OnTapSuccess({required this.onTapIndex});

  @override
  List<Object> get props => [onTapIndex!];
}
