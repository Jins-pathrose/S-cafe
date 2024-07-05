// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartAdapter extends TypeAdapter<Cart> {
  @override
  final int typeId = 3;

  @override
  Cart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cart(
      name: fields[0] as String?,
      price: fields[1] as String?,
      image: fields[2] as String?,
      count: fields[3] as int?,
      category: fields[5] as String?,
      discount: fields[6] as String?,
      id: fields[4] as int?,
      selectedSize: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Cart obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.count)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.discount)
      ..writeByte(7)
      ..write(obj.selectedSize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
