// ignore_for_file: camel_case_types

part of 'disc_bloc.dart';

abstract class DISCState extends Equatable {
  const DISCState();

  @override
  List<Object> get props => [];
}

class DiscInitial extends DISCState {}

class DISCOnTapSuccess extends DISCState {
  final int? onTapIndex;

  const DISCOnTapSuccess({required this.onTapIndex});

  @override
  List<Object> get props => [onTapIndex!];
}

class GetDISCTypeLoading extends DISCState {}

class GetDISCTypeSuccess extends DISCState {
  final List<DISCTypeModel> discTypeList;
  const GetDISCTypeSuccess({required this.discTypeList});

  @override
  List<Object> get props => [discTypeList];
}

class GetDISCTypeFailed extends DISCState {
  final String? message;
  const GetDISCTypeFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class GetDISCQuestionListLoading extends DISCState {}

class GetDISCQuestionListSuccess extends DISCState {
  final DISCQuestionModel discQuestionModel;
  const GetDISCQuestionListSuccess({required this.discQuestionModel});

  @override
  List<Object> get props => [discQuestionModel];
}

class GetDISCQuestionListFailed extends DISCState {
  final String? message;
  const GetDISCQuestionListFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class SendDISCAnswerListLoading extends DISCState {}

class SendDISCAnswerListSuccess extends DISCState {
  final DISCResult result;
  const SendDISCAnswerListSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

class SendDISCAnswerListFailed extends DISCState {
  final String? message;
  const SendDISCAnswerListFailed(this.message);

  @override
  List<Object> get props => [message!];
}
