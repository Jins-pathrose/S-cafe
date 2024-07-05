// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddproductAdapter extends TypeAdapter<Addproduct> {
  @override
  final int typeId = 2;

  @override
  Addproduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Addproduct(
      name: fields[0] as String?,
      price: fields[1] as String?,
      category: fields[2] as String?,
      discount: fields[3] as String?,
      image: fields[4] as String?,
      id: fields[5] as int?,
      selectedSize: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Addproduct obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.discount)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.selectedSize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddproductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
