import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_app/data/repository_data.dart';
import 'package:mini_app/model/model_pokemon.dart';

part 'fetchbloc_event.dart';
part 'fetchbloc_state.dart';

class FetchblocBloc extends Bloc<FetchblocEvent, FetchblocState> {
  FetchblocBloc() : super(FetchblocInitial()) {
    on<InitialFetching>((event, emit) async {
      emit(FetchLoading());
      List<ModelPokemon> result = await FetchApi().getPokemon();
      emit(FetchSuccess(result: [...result]));
    });
  }
}
