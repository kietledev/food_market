import 'package:food_market/api_provider/signin_api_provider.dart';
import 'package:food_market/models/result_model.dart';

class SigninRepository {
  final provider = SigninApiProvider();

  Future<ResultModel> onSignin(String body) => provider.onSignin(body);
}
