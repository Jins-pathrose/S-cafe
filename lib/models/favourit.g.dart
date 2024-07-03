// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddfavoriteAdapter extends TypeAdapter<Addfavorite> {
  @override
  final int typeId = 6;

  @override
  Addfavorite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Addfavorite(
      name: fields[0] as String?,
      price: fields[1] as String?,
      image: fields[2] as String?,
      discount: fields[3] as String?,
      category: fields[4] as String?,
      id: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Addfavorite obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.discount)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddfavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
