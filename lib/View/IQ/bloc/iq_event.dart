part of 'iq_bloc.dart';

abstract class IQEvent extends Equatable {
  const IQEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends IQEvent {
  final int? onTapIndex;
  const OnTapEvent({required this.onTapIndex});
}

class GetIQTypeEvent extends IQEvent {
  const GetIQTypeEvent();
}

class GetIQQuestionListEvent extends IQEvent {
  const GetIQQuestionListEvent();
}

class SendIQAnswerList extends IQEvent {
  final IQQuestionModel iqQuestionModel;
  const SendIQAnswerList(this.iqQuestionModel);
}
