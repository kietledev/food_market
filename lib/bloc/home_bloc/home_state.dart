part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class GetListFoodLoadingState extends HomeState {}

class GetListFoodSuccessState extends HomeState {
  List<FoodModel> listFood;
  GetListFoodSuccessState(this.listFood);
}

class GetListFoodErrorState extends HomeState {
  final String? error;

  GetListFoodErrorState({this.error});
}
