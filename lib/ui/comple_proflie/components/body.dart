import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_market/bloc/signup_bloc/signup_bloc.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/helpers/size_config.dart';
import 'package:food_market/repositories/signup_repository.dart';
import 'comple_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(SignupState(), SignupRepository()),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: <Widget>[
                  SizedBox(height: SizeConfig.screenHeight! * 0.03),
                  Text("Complete Profile", style: headingStyle),
                  Text(
                    "Complete your details or continue  \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.06),
                  CompleteProfileForm(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Text(
                    "By continuing your confirm that you agree \nwith our Term and Condition",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
