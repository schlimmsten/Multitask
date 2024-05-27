// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LessonAdapter extends TypeAdapter<Lesson> {
  @override
  final int typeId = 3;

  @override
  Lesson read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lesson(
      dayTitle: fields[0] as String,
      weekCode: fields[1] as int,
      time: fields[2] as String,
      discipline: fields[3] as String,
      lecturer: fields[4] as String,
      classroom: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Lesson obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.dayTitle)
      ..writeByte(1)
      ..write(obj.weekCode)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.discipline)
      ..writeByte(4)
      ..write(obj.lecturer)
      ..writeByte(5)
      ..write(obj.classroom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
