part of 'assignment_bloc.dart';

abstract class AssignmentEvent extends Equatable {
  const AssignmentEvent();

  @override
  List<Object> get props => [];
}

class UploadFile extends AssignmentEvent {
  final List<FileObject>? fileObjectList;

  const UploadFile({required this.fileObjectList});
}
