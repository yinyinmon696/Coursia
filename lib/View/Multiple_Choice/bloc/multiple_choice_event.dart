part of 'multiple_choice_bloc.dart';

abstract class MultipleChoiceEvent extends Equatable {
  const MultipleChoiceEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends MultipleChoiceEvent {
  final int? onTapIndex;
  const OnTapEvent({required this.onTapIndex});
}
