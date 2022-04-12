import 'package:autoponia_app/src/modules/plant/models/plant_model.dart';
import 'package:autoponia_app/src/modules/sprinker/models/sprinkler_model.dart';

abstract class SprinklerState {}

class IdleSprinklerState extends SprinklerState {}

class SuccessSprinklerState extends SprinklerState {
  final List<SprinklerModel> sprinkler;

  SuccessSprinklerState(this.sprinkler);
}

class LoadingSprinklerState extends SprinklerState {}

class NoDataSprinklerState extends SprinklerState {
  final message = 'Nenhum Irrigador encontrado, adicione um';
}

class ErrorSprinklerState extends SprinklerState {
  final String message;

  ErrorSprinklerState(this.message);
}
