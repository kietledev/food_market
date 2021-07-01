import 'package:food_market/models/result_model.dart';
import '../helpers/constants.dart';
import 'api_services.dart';

class SignupApiProvider {
  Future<ResultModel> onSignup(String body) {
    ApiServices apiServices = new ApiServices();
    return apiServices.post(URL.API_SIGNUP, body: body).then((dynamic data) {
      return new ResultModel.fromJson(data);
    });
  }
}
