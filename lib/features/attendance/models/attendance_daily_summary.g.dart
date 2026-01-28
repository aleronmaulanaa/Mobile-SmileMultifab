part of 'attendance_daily_summary.dart';

class AttendanceDailySummaryAdapter
    extends TypeAdapter<AttendanceDailySummary> {
  @override
  final int typeId = 2;

  @override
  AttendanceDailySummary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceDailySummary(
      date: fields[0] as DateTime,
      checkIn: fields[1] as DateTime?,
      checkOut: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceDailySummary obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.checkIn)
      ..writeByte(2)
      ..write(obj.checkOut);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceDailySummaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
