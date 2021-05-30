import 'package:flutter_blue/flutter_blue.dart';
import 'package:workout_companion_flutter/core/data/models/SensorModel.dart';
import 'package:meta/meta.dart';
import 'package:workout_companion_flutter/core/data/models/error/exceptions.dart';

abstract class BleDataSource {
  Future<Stream<List<SensorModel>>> getConnectedDevicesStream();
  Future<Stream<List<SensorModel>>> getFilteredDevicesStream();
  Future<void> pairDevice();
}

class BleDataSourceImpl implements BleDataSource {
  final FlutterBlue flutterBlue;

  BleDataSourceImpl({
    @required this.flutterBlue,
  });

  @override
  Future<Stream<List<SensorModel>>> getConnectedDevicesStream() async {
    if (!await flutterBlue.isOn) {
      throw BluetoothOffException();
    }
    if (!await flutterBlue.isAvailable) {
      throw BluetoothUnavailableException();
    }
    return flutterBlue.connectedDevices.asStream().asyncMap(
        (List<BluetoothDevice> devices) => devices
            .map((BluetoothDevice device) => SensorModel(
                name: device.name,
                id: device.id.id,
                type: SensorModel.getSensorTypeFromSpecs()))
            .toList());
  }

  @override
  Future<Stream<List<SensorModel>>> getFilteredDevicesStream() {
    // TODO: implement getFilteredDevicesStream
    throw UnimplementedError();
  }

  @override
  Future<void> pairDevice() {
    // TODO: implement pairDevice
    throw UnimplementedError();
  }
}
