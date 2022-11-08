import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_cubit_video/repository/home_repository.dart';

import '../models/home.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;

  HomeCubit(this._repository) : super(HomeInitialState());

  Future<void> fetchList() async {
    emit(HomeLoadingState());

    try {
      final response = await _repository.getAll();
      emit(HomeLoadedListState(response));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }


  }
}
