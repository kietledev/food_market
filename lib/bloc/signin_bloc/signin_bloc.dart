import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market/helpers/preferences.dart';
import 'package:food_market/models/result_model.dart';
import 'package:food_market/models/user_model.dart';
import 'package:food_market/repositories/signin_repository.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninRepository repository;
  SigninBloc(SigninState initialState, this.repository) : super(initialState);

  @override
  Stream<SigninState> mapEventToState(
    SigninEvent event,
  ) async* {
    if (event is RememberEvent) {
      yield RemembeState();
    } else if (event is DontRememberEvent) {
      yield DontRemembeState();
    } else if (event is SigninStartEvent) {
      yield SigninLoadingState();

      ResultModel resultModel = await repository.onSignin(event.body);
      if (resultModel.code == 200) {
        UserModel userModel = UserModel.fromJson(resultModel.data);
        if (event.remember) {
          if (userModel.token!.length > 0) {
            final Preferences pref = Preferences();
            pref.setToken(userModel.token!);
          }
        }

        yield SigninSuccessState();
      } else {
        yield SigninErrorState(error: resultModel.message);
      }
    }
  }
}
