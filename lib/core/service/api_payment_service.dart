import 'package:dio/dio.dart';

class ApiPaymentService {
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ),
  );

  Future<Response> post(
      {required body,
      required String url,
      required String token,
      String? contentType}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
            contentType: contentType,
            headers: {'Authorization': "Bearer $token"}));
    return response;
  }
}
