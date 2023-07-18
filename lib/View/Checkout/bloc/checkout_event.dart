part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends CheckoutEvent {
  final int? onTapIndex;
  const OnTapEvent({required this.onTapIndex});
}
