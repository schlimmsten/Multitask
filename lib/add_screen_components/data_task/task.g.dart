// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 1;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      name: fields[0] as String,
      description: fields[1] as String,
      selectedDay: fields[2] as String,
      selectedMonth: fields[3] as String,
      selectedYear: fields[4] as String,
      selectedTime: fields[5] as String,
      category: fields[6] as String,
      color: fields[7] as Color?,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.selectedDay)
      ..writeByte(3)
      ..write(obj.selectedMonth)
      ..writeByte(4)
      ..write(obj.selectedYear)
      ..writeByte(5)
      ..write(obj.selectedTime)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ColorAdapter extends TypeAdapter<Color?> {
  @override
  final int typeId = 2; // Уникальный идентификатор для типа Color

  @override
  Color? read(BinaryReader reader) {
    int? value = reader.readInt();
    return value != null ? Color(value) : null;
  }

  @override
  void write(BinaryWriter writer, Color? obj) {
    writer.writeInt(obj?.value ?? 0);
  }
}
