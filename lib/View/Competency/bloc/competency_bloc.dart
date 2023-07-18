import 'package:coursia/Model/competency_question_model.dart';
import 'package:coursia/Model/competency_type_model.dart';
import 'package:coursia/Repository/coursia_repository.dart';
import 'package:coursia/Utils/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'competency_event.dart';
part 'competency_state.dart';

class CompetencyBloc extends Bloc<CompetencyEvent, CompetencyState> {
  CoursiaRepository coursiaRepository = CoursiaRepository();
  CompetencyBloc() : super(CompetencyInitial()) {
    on<OnTapEvent>(_onTapEvent);
    on<GetCompetencyTypeEvent>(_getCompetencyTypeEvent);
    on<GetCompetencyQuestionListEvent>(_getCompetencyQuestionListEvent);
    on<SendCompetencyAnswerList>(_sendCompetencyAnswerList);
  }

  _onTapEvent(OnTapEvent event, Emitter<CompetencyState> emit) {
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }

  _getCompetencyTypeEvent(
      GetCompetencyTypeEvent event, Emitter<CompetencyState> emit) async {
    emit(GetCompetencyTypeLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetCompetencyTypeFailed("No Network Connection!"));
    } else {
      try {
        List<CompetencyTypeModel> competencyTypeList;
        competencyTypeList = await coursiaRepository.getCompetencyTypeList();
        emit(GetCompetencyTypeSuccess(competencyTypeList: competencyTypeList));
      } catch (e) {
        emit(GetCompetencyTypeFailed(e.toString()));
      }
    }
  }

  _getCompetencyQuestionListEvent(GetCompetencyQuestionListEvent event,
      Emitter<CompetencyState> emit) async {
    emit(GetCompetencyQuestionListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetCompetencyQuestionListFailed("No Network Connection!"));
    } else {
      try {
        CompetencyQuestionModel competencyQuestionModel;
        competencyQuestionModel =
            await coursiaRepository.getCompetencyQuestionList();
        emit(GetCompetencyQuestionListSuccess(
            competencyQuestionModel: competencyQuestionModel));
      } catch (e) {
        emit(GetCompetencyQuestionListFailed(e.toString()));
      }
    }
  }

  _sendCompetencyAnswerList(
      SendCompetencyAnswerList event, Emitter<CompetencyState> emit) async {
    emit(SendCompetencyAnswerListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const SendCompetencyAnswerListFailed("No Network Connection!"));
    } else {
      try {
        CompetencyResult result;
        result = await coursiaRepository
            .sendCompetencyAnswerList(event.competencyQuestionModel);
        emit(SendCompetencyAnswerListSuccess(result: result));
      } catch (e) {
        emit(SendCompetencyAnswerListFailed(e.toString()));
      }
    }
  }
}
