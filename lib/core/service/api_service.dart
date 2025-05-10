import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final baseUrl = "https://www.googleapis.com/books/v1/";

  ApiService(this.dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<BookEntity> fetchBookById(String bookId) async {
    final response = await dio.get('$baseUrl/volumes/$bookId'); // Fixed URL
    return response.data;
  }
}
