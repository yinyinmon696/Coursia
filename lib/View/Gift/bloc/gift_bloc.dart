import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gift_event.dart';
part 'gift_state.dart';

class GiftBloc extends Bloc<GiftEvent, GiftState> {
  GiftBloc() : super(GiftInitial()) {
    on<GetCode>(_onGetCode);
  }

  _onGetCode(GetCode event, Emitter<GiftState> emit) {
    emit(GetCodeSuccess(code: event.code));
  }
}
