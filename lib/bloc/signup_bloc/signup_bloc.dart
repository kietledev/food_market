import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market/models/result_model.dart';
import 'package:food_market/repositories/signup_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupRepository repository;
  SignupBloc(SignupState initialState, this.repository) : super(initialState);

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is SignupStartEvent) {
      yield SignupLoadingState();

      ResultModel resultModel = await repository.onSignup(event.body);
      if (resultModel.code == 200) {
        yield SignupSuccessState();
      } else {
        yield SignupErrorState(error: resultModel.message);
      }
    }
  }

  getData() {}
}
