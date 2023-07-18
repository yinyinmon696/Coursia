import 'package:coursia/Model/quiz_question_model.dart';
import 'package:coursia/Model/quiz_type_model.dart';
import 'package:coursia/Repository/coursia_repository.dart';
import 'package:coursia/Utils/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  CoursiaRepository coursiaRepository = CoursiaRepository();
  QuizBloc() : super(QuizInitial()) {
    on<OnTapEvent>(_onTapEvent);
    on<GetQuizTypeEvent>(_getQuizTypeEvent);
    on<GetQuizQuestionListEvent>(_getQuizQuestionListEvent);
    on<SendQuizAnswerList>(_sendQuizAnswerList);
  }

  _onTapEvent(OnTapEvent event, Emitter<QuizState> emit) {
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }

  _getQuizTypeEvent(GetQuizTypeEvent event, Emitter<QuizState> emit) async {
    emit(GetQuizTypeLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetQuizTypeFailed("No Network Connection!"));
    } else {
      try {
        List<QuizTypeModel> quizTypeList;
        quizTypeList = await coursiaRepository.getQuizTypeList();
        emit(GetQuizTypeSuccess(quizTypeList: quizTypeList));
      } catch (e) {
        emit(GetQuizTypeFailed(e.toString()));
      }
    }
  }

  _getQuizQuestionListEvent(
      GetQuizQuestionListEvent event, Emitter<QuizState> emit) async {
    emit(GetQuizQuestionListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetQuizQuestionListFailed("No Network Connection!"));
    } else {
      try {
        QuizQuestionModel quizQuestionModel;
        quizQuestionModel =
            await coursiaRepository.getQuizQuestionList(event.quizTypeId);
        emit(GetQuizQuestionListSuccess(quizQuestionModel: quizQuestionModel));
      } catch (e) {
        emit(GetQuizQuestionListFailed(e.toString()));
      }
    }
  }

  _sendQuizAnswerList(SendQuizAnswerList event, Emitter<QuizState> emit) async {
    emit(SendQuizAnswerListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const SendQuizAnswerListFailed("No Network Connection!"));
    } else {
      try {
        QuizResult result;
        result =
            await coursiaRepository.sendQuizAnswerList(event.quizQuestionModel);
        emit(SendQuizAnswerListSuccess(result: result));
      } catch (e) {
        emit(SendQuizAnswerListFailed(e.toString()));
      }
    }
  }
}
