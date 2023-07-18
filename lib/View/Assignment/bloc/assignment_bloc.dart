import 'package:coursia/Model/fileobject.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'assignment_event.dart';
part 'assignment_state.dart';

class AssignmentBloc extends Bloc<AssignmentEvent, AssignmentState> {
  AssignmentBloc() : super(AssignmentInitial()) {
    on<UploadFile>(_onUploadFile);
  }

  _onUploadFile(UploadFile event, Emitter<AssignmentState> emit) {
    emit(UploadFileLoading());
    emit(UploadFileSuccess(fileObjectList: event.fileObjectList));
  }
}
