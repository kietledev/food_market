import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market/models/food_model.dart';
import 'package:food_market/models/result_model.dart';
import 'package:food_market/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository repository;
  HomeBloc(HomeState initialState, this.repository) : super(initialState);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetListFoodStartEvent) {
      yield GetListFoodLoadingState();

      ResultModel resultModel = await repository.getListFood(event.date);
      if (resultModel.code == 200) {
        List<FoodModel> listFood = List<FoodModel>.from(
            resultModel.data.map((model) => FoodModel.fromJson(model)));
        if (listFood.length > 0) {

          yield GetListFoodSuccessState(listFood);
        } else {
          yield GetListFoodErrorState(error: 'Không có món ăn mới');
        }
      } else {
        yield GetListFoodErrorState(error: resultModel.message);
      }
    }
  }
}
