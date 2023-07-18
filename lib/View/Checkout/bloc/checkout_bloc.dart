import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    on<OnTapEvent>(_onTapEvent);
  }

  _onTapEvent(OnTapEvent event, Emitter<CheckoutState> emit) {
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }
}
