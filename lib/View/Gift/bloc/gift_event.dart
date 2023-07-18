part of 'gift_bloc.dart';

abstract class GiftEvent extends Equatable {
  const GiftEvent();

  @override
  List<Object> get props => [];
}

class GetCode extends GiftEvent {
  final String? code;
  const GetCode({required this.code});
}
