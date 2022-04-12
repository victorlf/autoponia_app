import 'package:autoponia_app/src/modules/plant/models/plant_model.dart';

abstract class PlantState {}

class IdlePlantState extends PlantState {}

class SuccessPlantState extends PlantState {
  final List<PlantModel> plants;

  SuccessPlantState(this.plants);
}

class LoadingPlantState extends PlantState {}

class NoDataPlantState extends PlantState {
  final message = 'Nenhuma Planta Encontrada';
}

class ErrorPlantState extends PlantState {
  final String message;

  ErrorPlantState(this.message);
}
