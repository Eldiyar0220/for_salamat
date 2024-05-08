import 'package:bloc/bloc.dart';
import 'package:dimplom/screens/homescreen/data/model.dart';
import 'package:dimplom/screens/homescreen/data/repository.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(HomeInitial());
  final Repository _repo;

  Future<void> getDataCubit() async {
    try {
      emit(HomeLoading());
      final result = await _repo.getData();
      emit(HomeSuccess(topics: result));
    } catch (e) {
      emit(HomeError(e));
    }
  }
}
