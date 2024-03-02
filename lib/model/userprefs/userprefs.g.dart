// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userprefs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserpreferenceAdapter extends TypeAdapter<Userpreference> {
  @override
  final int typeId = 2;

  @override
  Userpreference read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Userpreference(
      showonboarding: fields[0] as bool?,
      username: fields[1] as String?,
    )..usernameadded = fields[2] as bool?;
  }

  @override
  void write(BinaryWriter writer, Userpreference obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.showonboarding)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.usernameadded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserpreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
