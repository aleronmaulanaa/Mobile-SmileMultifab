part of 'attendance_history.dart';

class AttendanceHistoryAdapter extends TypeAdapter<AttendanceHistory> {
  @override
  final int typeId = 1;

  @override
  AttendanceHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceHistory(
      imagePath: fields[0] as String,
      checkInTime: fields[1] as DateTime,
      latitude: fields[2] as double,
      longitude: fields[3] as double,
      isOnline: fields[4] as bool,
      photoStatus: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceHistory obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.imagePath)
      ..writeByte(1)
      ..write(obj.checkInTime)
      ..writeByte(2)
      ..write(obj.latitude)
      ..writeByte(3)
      ..write(obj.longitude)
      ..writeByte(4)
      ..write(obj.isOnline)
      ..writeByte(5)
      ..write(obj.photoStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
