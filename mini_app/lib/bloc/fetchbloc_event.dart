part of 'fetchbloc_bloc.dart';

abstract class FetchblocEvent extends Equatable {
  const FetchblocEvent();

  @override
  List<Object> get props => [];
}

class InitialFetching extends FetchblocEvent {}

class InitialProfile extends FetchblocEvent {}
