// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OredrplaceAdapter extends TypeAdapter<Oredrplace> {
  @override
  final int typeId = 5;

  @override
  Oredrplace read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Oredrplace(
      id: fields[0] as int?,
      productName: fields[1] as String,
      productPrice: fields[2] as String,
      productsize: fields[3] as String,
      productImage: fields[11] as String,
      totalPrice: fields[5] as int,
      productCount: fields[4] as int,
      deliveryName: fields[7] as String,
      deliveryPhone: fields[8] as String,
      deliveryAddress: fields[6] as String,
      deliveryCity: fields[9] as String,
      pincode: fields[10] as String,
      status: fields[12] as int?,
      date: fields[13] as String,
      time: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Oredrplace obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productPrice)
      ..writeByte(3)
      ..write(obj.productsize)
      ..writeByte(4)
      ..write(obj.productCount)
      ..writeByte(5)
      ..write(obj.totalPrice)
      ..writeByte(6)
      ..write(obj.deliveryAddress)
      ..writeByte(7)
      ..write(obj.deliveryName)
      ..writeByte(8)
      ..write(obj.deliveryPhone)
      ..writeByte(9)
      ..write(obj.deliveryCity)
      ..writeByte(10)
      ..write(obj.pincode)
      ..writeByte(11)
      ..write(obj.productImage)
      ..writeByte(12)
      ..write(obj.status)
      ..writeByte(13)
      ..write(obj.date)
      ..writeByte(14)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OredrplaceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
