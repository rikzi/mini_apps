// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fetchbloc_bloc.dart';

abstract class FetchblocState extends Equatable {
  const FetchblocState();

  @override
  List<Object> get props => [];
}

class FetchblocInitial extends FetchblocState {}

class FetchLoading extends FetchblocState {}

class FetchSuccess extends FetchblocState {
  List<ModelPokemon> result;
  FetchSuccess({
    required this.result,
  });

  @override
  List<Object> get props => [result];
}

class FetchingHiveSuccess extends FetchblocState {}
