// ignore_for_file: annotate_overrides

part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];

  List<QuizTypeModel> get quizTypeList => [];
}

class QuizInitial extends QuizState {}

class OnTapSuccess extends QuizState {
  final int? onTapIndex;
  const OnTapSuccess({required this.onTapIndex});

  @override
  List<Object> get props => [onTapIndex!];
}

class GetQuizTypeLoading extends QuizState {}

class GetQuizTypeSuccess extends QuizState {
  final List<QuizTypeModel> quizTypeList;
  const GetQuizTypeSuccess({required this.quizTypeList});

  @override
  List<Object> get props => [quizTypeList];
}

class GetQuizTypeFailed extends QuizState {
  final String? message;
  const GetQuizTypeFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class GetQuizQuestionListLoading extends QuizState {}

class GetQuizQuestionListSuccess extends QuizState {
  final QuizQuestionModel quizQuestionModel;
  const GetQuizQuestionListSuccess({required this.quizQuestionModel});

  @override
  List<Object> get props => [quizQuestionModel];
}

class GetQuizQuestionListFailed extends QuizState {
  final String? message;
  const GetQuizQuestionListFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class SendQuizAnswerListLoading extends QuizState {}

class SendQuizAnswerListSuccess extends QuizState {
  final QuizResult result;
  const SendQuizAnswerListSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

class SendQuizAnswerListFailed extends QuizState {
  final String? message;
  const SendQuizAnswerListFailed(this.message);

  @override
  List<Object> get props => [message!];
}
