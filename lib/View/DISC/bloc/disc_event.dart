part of 'disc_bloc.dart';

abstract class DISCEvent extends Equatable {
  const DISCEvent();

  @override
  List<Object> get props => [];
}

class DISCOnTapEvent extends DISCEvent {
  // final bool? onTap;
  final int? onTapIndex;
  // const OnTapEvent({required this.onTapIndex, this.onTap});
  const DISCOnTapEvent({required this.onTapIndex});
}

class GetDISCTypeEvent extends DISCEvent {
  const GetDISCTypeEvent();
}

class GetDISCQuestionListEvent extends DISCEvent {
  const GetDISCQuestionListEvent();
}

class SendDISCAnswerList extends DISCEvent {
  final DISCQuestionModel discQuestionModel;
  const SendDISCAnswerList(this.discQuestionModel);
}
