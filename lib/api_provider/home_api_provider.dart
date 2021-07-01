import 'package:food_market/models/result_model.dart';

import '../helpers/constants.dart';
import 'api_services.dart';

class HomeApiProvider {
  Future<ResultModel> getListFood(String date) {
    ApiServices apiServices = new ApiServices();
    return apiServices
        .get(URL.API_GET_LIST_FOOD + '$date/10')
        .then((dynamic data) {
      return new ResultModel.fromJson(data);
    });
  }

  onSignin(String body) {}
}
