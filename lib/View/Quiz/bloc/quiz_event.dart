part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends QuizEvent {
  final int? onTapIndex;
  const OnTapEvent({required this.onTapIndex});
}

class GetQuizTypeEvent extends QuizEvent {
  const GetQuizTypeEvent();
}

class GetQuizQuestionListEvent extends QuizEvent {
  final int? quizTypeId;
  const GetQuizQuestionListEvent({required this.quizTypeId});
}

class SendQuizAnswerList extends QuizEvent {
  final QuizQuestionModel quizQuestionModel;
  const SendQuizAnswerList(this.quizQuestionModel);
}
