import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'multiple_choice_event.dart';
part 'multiple_choice_state.dart';

class MultipleChoiceBloc
    extends Bloc<MultipleChoiceEvent, MultipleChoiceState> {
  MultipleChoiceBloc() : super(MultipleChoiceInitial()) {
    on<OnTapEvent>(_onTapEvent);
  }
  _onTapEvent(OnTapEvent event, Emitter<MultipleChoiceState> emit) {
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }
}
