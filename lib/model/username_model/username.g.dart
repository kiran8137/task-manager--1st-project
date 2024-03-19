// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'username.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsernameAdapter extends TypeAdapter<Username> {
  @override
  final int typeId = 4;

  @override
  Username read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Username(
      name: fields[0] as String?,
      nameentered: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Username obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.nameentered)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsernameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
