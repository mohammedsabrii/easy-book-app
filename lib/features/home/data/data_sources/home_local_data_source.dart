import 'package:asay_book_app/core/utils/constens.dart';
import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchPopularBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int lenght = box.values.length;
    if (startIndex >= lenght || endIndex > lenght) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchPopularBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kNewestBox);
    int lenght = box.values.length;
    if (startIndex >= lenght || endIndex > lenght) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
