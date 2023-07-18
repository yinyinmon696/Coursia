import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'evaluation_event.dart';
part 'evaluation_state.dart';

class EvaluationBloc extends Bloc<EvaluationEvent, EvaluationState> {
  EvaluationBloc() : super(EvaluationInitial()) {
    on<OnTapEvent>(_onTapEvent);
    on<Rating>(_onRating);
  }

  _onTapEvent(OnTapEvent event, Emitter<EvaluationState> emit) {
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }

  _onRating(Rating event, Emitter<EvaluationState> emit) {
    emit(RatingSuccess(rating: event.rating));
  }
}
