import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static ApiServices instance = new ApiServices.internal();
  ApiServices.internal();
  factory ApiServices() => instance;

  final JsonDecoder decoder = new JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(Uri.parse(url)).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      // print(res);
      if (statusCode < 200 || statusCode > 400) {
        throw new Exception("Error while fetching data");
      }
      return decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {body, encoding}) {
    return http
        .post(Uri.parse(url), body: body, encoding: encoding)
        .then((http.Response response) {
      return decoder.convert(response.body);
      // if (response.statusCode == 200 || response.statusCode == 500) {
      //   return decoder.convert(response.body);
      // } else {
      //   throw new Exception("Error while fetching data");
      // }
    });
  }
}
