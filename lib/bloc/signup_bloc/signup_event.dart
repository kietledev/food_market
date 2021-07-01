part of 'signup_bloc.dart';

class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

// class StartEvent extends SignupEvent {}

class SignupStartEvent extends SignupEvent {
  final String body;

  SignupStartEvent({required this.body});
}
