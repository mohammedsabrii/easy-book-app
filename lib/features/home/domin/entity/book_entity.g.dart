// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      image: fields[0] as String?,
      title: fields[1] as String?,
      auther: fields[2] as String?,
      rate: fields[3] as num?,
      pagenumpers: fields[4] as num?,
      price: fields[8] as num?,
      descriptions: fields[6] as String?,
      catgory: fields[7] as String?,
      priceState: fields[5] as String?,
      bookId: fields[9] as String,
      url: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.auther)
      ..writeByte(3)
      ..write(obj.rate)
      ..writeByte(4)
      ..write(obj.pagenumpers)
      ..writeByte(5)
      ..write(obj.priceState)
      ..writeByte(6)
      ..write(obj.descriptions)
      ..writeByte(7)
      ..write(obj.catgory)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.bookId)
      ..writeByte(10)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
