part of 'location_tracking.dart';

class LocationTrackingAdapter extends TypeAdapter<LocationTracking> {
  @override
  final int typeId = 3;

  @override
  LocationTracking read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationTracking(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
      time: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, LocationTracking obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationTrackingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
