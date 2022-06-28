import 'package:dio/dio.dart';
import 'package:tour_app/shared/helper/mangers/constants.dart';

class DioHelper {
  static Dio? _dio;

  static init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ConstantsManger.BASE_URL,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      headers: {
        "Content-Type":"application/json"
      },
    );
    _dio = Dio(baseOptions);
  }

  Future<Response> getData(
      {required path, Map<String, dynamic> ? map}) async {
    return await _dio!.get(path, queryParameters: map);
  }

  Future<Response> postData({
    required path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    return await _dio!.post(path, queryParameters: query, data: data);
  }

}
