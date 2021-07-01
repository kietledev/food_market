part of 'signin_bloc.dart';

class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}

class RememberEvent extends SigninEvent {}

class DontRememberEvent extends SigninEvent {}

class SigninStartEvent extends SigninEvent {
  final bool remember;
  final String body;

  SigninStartEvent({required this.body, required this.remember});
}
