import 'package:articles/models/home_model.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio;
  String apiKey = '3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9';
  String mainUrl = "https://api.nytimes.com/svc/topstories/v2/home.json";

  static init() {
    dio = Dio();
  }

  Future<Home> getHomeData() async {
    var params = {"api-key": apiKey};

    Response response = await dio.get(
      mainUrl,
      queryParameters: params,
    );

    return Home.fromJson(response.data);
  }
}
