import 'package:food_market/api_provider/home_api_provider.dart';
import 'package:food_market/models/result_model.dart';

class HomeRepository {
  final provider = HomeApiProvider();

  Future<ResultModel> getListFood(String date) => provider.getListFood(date);
}
