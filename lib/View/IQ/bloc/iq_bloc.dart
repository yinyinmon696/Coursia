import 'package:coursia/Model/iq_question_model.dart';
import 'package:coursia/Model/iq_type_model.dart';
import 'package:coursia/Repository/coursia_repository.dart';
import 'package:coursia/Utils/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'iq_event.dart';
part 'iq_state.dart';

class IqBloc extends Bloc<IQEvent, IQState> {
  CoursiaRepository coursiaRepository = CoursiaRepository();
  IqBloc() : super(IqInitial()) {
    on<OnTapEvent>(_onTapEvent);
    on<GetIQTypeEvent>(_getIQTypeEvent);
    on<GetIQQuestionListEvent>(_getIQQuestionListEvent);
    on<SendIQAnswerList>(_sendIQAnswerList);
  }

  _onTapEvent(OnTapEvent event, Emitter<IQState> emit) {
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }

  _getIQTypeEvent(GetIQTypeEvent event, Emitter<IQState> emit) async {
    emit(GetIQTypeLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetIQTypeFailed("No Network Connection!"));
    } else {
      try {
        List<IQTypeModel> iqTypeList;
        iqTypeList = await coursiaRepository.getIQTypeList();
        emit(GetIQTypeSuccess(iqTypeList: iqTypeList));
      } catch (e) {
        emit(GetIQTypeFailed(e.toString()));
      }
    }
  }

  _getIQQuestionListEvent(
      GetIQQuestionListEvent event, Emitter<IQState> emit) async {
    emit(GetIQQuestionListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetIQQuestionListFailed("No Network Connection!"));
    } else {
      try {
        IQQuestionModel iqQuestionModel;
        iqQuestionModel = await coursiaRepository.getIQQuestionList();
        emit(GetIQQuestionListSuccess(iqQuestionModel: iqQuestionModel));
      } catch (e) {
        emit(GetIQQuestionListFailed(e.toString()));
      }
    }
  }

  _sendIQAnswerList(SendIQAnswerList event, Emitter<IQState> emit) async {
    emit(SendIQAnswerListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const SendIQAnswerListFailed("No Network Connection!"));
    } else {
      try {
        IQResult result;
        result =
            await coursiaRepository.sendIQAnswerList(event.iqQuestionModel);
        emit(SendIQAnswerListSuccess(result: result));
      } catch (e) {
        emit(SendIQAnswerListFailed(e.toString()));
      }
    }
  }
}
