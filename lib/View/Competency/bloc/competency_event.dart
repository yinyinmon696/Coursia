part of 'competency_bloc.dart';

abstract class CompetencyEvent extends Equatable {
  const CompetencyEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends CompetencyEvent {
  final int? onTapIndex;
  const OnTapEvent({required this.onTapIndex});
}

class GetCompetencyTypeEvent extends CompetencyEvent {
  const GetCompetencyTypeEvent();
}

class GetCompetencyQuestionListEvent extends CompetencyEvent {
  const GetCompetencyQuestionListEvent();
}

class SendCompetencyAnswerList extends CompetencyEvent {
  final CompetencyQuestionModel competencyQuestionModel;
  const SendCompetencyAnswerList(this.competencyQuestionModel);
}
