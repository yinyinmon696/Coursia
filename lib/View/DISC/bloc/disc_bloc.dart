import 'package:coursia/Model/disc_question_model.dart';
import 'package:coursia/Model/disc_type_model.dart';
import 'package:coursia/Repository/coursia_repository.dart';
import 'package:coursia/Utils/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'disc_event.dart';
part 'disc_state.dart';

class DISCBloc extends Bloc<DISCEvent, DISCState> {
  CoursiaRepository coursiaRepository = CoursiaRepository();
  DISCBloc() : super(DiscInitial()) {
    on<DISCOnTapEvent>(_onTapEvent);
    on<GetDISCTypeEvent>(_getDISCTypeEvent);
    on<GetDISCQuestionListEvent>(_getDISCQuestionListEvent);
    on<SendDISCAnswerList>(_sendDISCAnswerList);
  }

  _onTapEvent(DISCOnTapEvent event, Emitter<DISCState> emit) {
    // emit(OnTapSuccess(onTapIndex: event.onTapIndex, onTap: event.onTap));
    emit(DISCOnTapSuccess(onTapIndex: event.onTapIndex));
  }

  _getDISCTypeEvent(GetDISCTypeEvent event, Emitter<DISCState> emit) async {
    emit(GetDISCTypeLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetDISCTypeFailed("No Network Connection!"));
    } else {
      try {
        List<DISCTypeModel> discTypeList;
        discTypeList = await coursiaRepository.getDISCTypeList();
        emit(GetDISCTypeSuccess(discTypeList: discTypeList));
      } catch (e) {
        emit(GetDISCTypeFailed(e.toString()));
      }
    }
  }

  _getDISCQuestionListEvent(
      GetDISCQuestionListEvent event, Emitter<DISCState> emit) async {
    emit(GetDISCQuestionListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetDISCQuestionListFailed("No Network Connection!"));
    } else {
      try {
        DISCQuestionModel discQuestionModel;
        discQuestionModel = await coursiaRepository.getDISCQuestionList();
        emit(GetDISCQuestionListSuccess(discQuestionModel: discQuestionModel));
      } catch (e) {
        emit(GetDISCQuestionListFailed(e.toString()));
      }
    }
  }

  _sendDISCAnswerList(SendDISCAnswerList event, Emitter<DISCState> emit) async {
    emit(SendDISCAnswerListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const SendDISCAnswerListFailed("No Network Connection!"));
    } else {
      try {
        DISCResult result;
        result =
            await coursiaRepository.sendDISCAnswerList(event.discQuestionModel);
        emit(SendDISCAnswerListSuccess(result: result));
      } catch (e) {
        emit(SendDISCAnswerListFailed(e.toString()));
      }
    }
  }
}
