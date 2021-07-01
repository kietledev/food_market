import 'package:food_market/api_provider/signup_api_provider.dart';
import 'package:food_market/models/result_model.dart';

class SignupRepository {
  final provider = SignupApiProvider();

  Future<ResultModel> onSignup(String body) => provider.onSignup(body);
}
