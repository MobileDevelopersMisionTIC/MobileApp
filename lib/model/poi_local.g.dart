// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PoiLocalAdapter extends TypeAdapter<PoiLocal> {
  @override
  final int typeId = 0;

  @override
  PoiLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PoiLocal()
      ..id = fields[0] as String?
      ..nombre = fields[1] as String?
      ..ciudad = fields[2] as String?
      ..foto = fields[3] as String?
      ..descripcion = fields[4] as String?
      ..puntuacion = fields[5] as int?;
  }

  @override
  void write(BinaryWriter writer, PoiLocal obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.ciudad)
      ..writeByte(3)
      ..write(obj.foto)
      ..writeByte(4)
      ..write(obj.descripcion)
      ..writeByte(5)
      ..write(obj.puntuacion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PoiLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
