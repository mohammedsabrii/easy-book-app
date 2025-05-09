import 'package:asay_book_app/core/service/api_service.dart';
import 'package:asay_book_app/core/utils/constens.dart';
import 'package:asay_book_app/core/utils/function/save_box.dart';
import 'package:asay_book_app/features/home/data/model/easy_book_model/item.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchPopularBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchFavoritesBooks({required List<String> title});
  Future<List<BookEntity>> fetchSearchResault(
      {required String title, int pageNumber = 0});
  Future<List<BookEntity>> fetchCategoryResault(
      {required String title, int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?q=subject: Featured books&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooks(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchPopularBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: 'volumes?q=subject: famous&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooks(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSearchResault(
      {required String title, int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: 'volumes?q=$title&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchFavoritesBooks(
      {required List<String> title}) async {
    var data =
        await apiService.get(endPoint: 'volumes?q=id:${title.join(",")}');

    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchCategoryResault({
    required String title,
    int pageNumber = 0,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=subject:$title&startIndex=${pageNumber * 10}',
      );

      if (data['items'] == null || data['items'] is! Iterable) {
        return [];
      }
      List<BookEntity> books = getBooksList(data);
      return books;
    } catch (e) {
      rethrow;
    }
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(Item.fromJson(bookMap));
    }
    return books;
  }
}
