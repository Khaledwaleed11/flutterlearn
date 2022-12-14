import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers:
        {
          'content-type' : 'application/json',
        }
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {'lang' : lang,
      'Authorization' : token,};
    return await Dio().get("https://newsapi.org/$url", queryParameters: query);
  }
  static Future<Response> PostData({
    required String url,
     Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang = 'ar',
    String? token,

  }) async
  {
    dio.options.headers = {'lang' : lang,
      'Authorization' : token,};
    return dio.post(
      url,
      queryParameters: query,
      data: data,

    );
  }
}
