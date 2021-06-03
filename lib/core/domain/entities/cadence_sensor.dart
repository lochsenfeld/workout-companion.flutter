import 'package:flutter/material.dart';
import 'package:workout_companion_flutter/core/domain/entities/sensor.dart';

class CadenceSensor extends Sensor {
  CadenceSensor({
    @required name,
    @required id,
    @required bluetoothDevice,
  }) : super(
          id: id,
          name: name,
          type: SensorType.Cadence,
          bluetoothDevice: bluetoothDevice,
        );
}
