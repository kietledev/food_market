part of 'signin_bloc.dart';

class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

class RemembeState extends SigninState {}

class DontRemembeState extends SigninState {}

class SigninLoadingState extends SigninState {}

class SigninSuccessState extends SigninState {}

class SigninErrorState extends SigninState {
  final String? error;

  SigninErrorState({this.error});
}
