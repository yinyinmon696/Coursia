import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<OnTapEvent>(_onTapEvent);
  }

  _onTapEvent(OnTapEvent event, Emitter<HomeState> emit) {
    emit(OnTapLoading());
    emit(OnTapSuccess(
        onTapIndex: event.onTapIndex, coursesName: event.courseName));
  }
}
