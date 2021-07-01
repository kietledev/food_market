part of 'signup_bloc.dart';

class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

// class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {}

class SignupErrorState extends SignupState {
  final String? error;

  SignupErrorState({this.error});
}
