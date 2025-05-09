import 'package:asay_book_app/features/home/domin/entity/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooks(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
