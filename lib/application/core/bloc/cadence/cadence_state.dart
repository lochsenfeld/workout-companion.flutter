part of 'cadence_bloc.dart';

@freezed
class CadenceState with _$CadenceState {
  const factory CadenceState.initial() = _Initial;
  const factory CadenceState.disconnected() = _Disconnected;
  const factory CadenceState.searching() = _Searching;
  const factory CadenceState.connected(
      CadenceRepository cadenceRepository, int? rpm) = _Connected;
}
