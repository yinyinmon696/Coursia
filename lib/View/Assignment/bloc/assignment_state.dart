part of 'assignment_bloc.dart';

abstract class AssignmentState extends Equatable {
  const AssignmentState();

  @override
  List<Object> get props => [];
}

class AssignmentInitial extends AssignmentState {}

class UploadFileSuccess extends AssignmentState {
  final List<FileObject>? fileObjectList;
  const UploadFileSuccess({required this.fileObjectList});

  @override
  List<Object> get props => [fileObjectList!];
}

class UploadFileLoading extends AssignmentState {}

class UploadFileFailed extends AssignmentState {
  final String? message;
  const UploadFileFailed(this.message);

  @override
  List<Object> get props => [message!];
}
