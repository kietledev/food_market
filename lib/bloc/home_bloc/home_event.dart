part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetListFoodStartEvent extends HomeEvent {
  final String date;

  GetListFoodStartEvent({required this.date});
}
