part of 'gift_bloc.dart';

abstract class GiftState extends Equatable {
  const GiftState();

  @override
  List<Object> get props => [];
}

class GiftInitial extends GiftState {}

class GetCodeSuccess extends GiftState {
  final String? code;

  const GetCodeSuccess({required this.code});

  @override
  List<Object> get props => [code!];
}
