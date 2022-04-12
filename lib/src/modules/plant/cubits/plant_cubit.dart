import 'package:autoponia_app/src/modules/plant/cubits/plant_state.dart';
import 'package:autoponia_app/src/modules/plant/models/plant_model.dart';
import 'package:autoponia_app/src/modules/plant/services/plant_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlantCubit extends Cubit<PlantState> {
  final PlantService _plantService;
  PlantCubit(this._plantService) : super(IdlePlantState());

  List<PlantModel> _plants = [];

  List<PlantModel> get plants => List<PlantModel>.unmodifiable(_plants);

  Future<void> fetchAll() async {
    emit(LoadingPlantState());
    try {
      _plants = await _plantService.fetch();
      if (_plants.isEmpty) {
        emit(NoDataPlantState());
      } else {
        emit(SuccessPlantState(_plants));
      }
    } catch (e) {
      emit(ErrorPlantState(e.toString()));
    }
  }

  Future<void> create(PlantModel plant) async {
    emit(LoadingPlantState());
    try {
      await _plantService.create(plant);

      emit(SuccessPlantState(_plants));
    } catch (e) {
      emit(ErrorPlantState(''));
    }
  }

  Future<void> update(PlantModel plant) async {
    emit(LoadingPlantState());
    try {
      await _plantService.update(plant);

      emit(SuccessPlantState(_plants));
    } catch (e) {
      emit(ErrorPlantState(''));
    }
  }

  Future<void> delete(PlantModel plant) async {
    emit(LoadingPlantState());
    try {
      await _plantService.delete(plant.id);

      emit(SuccessPlantState(_plants));
    } catch (e) {
      emit(ErrorPlantState(''));
    }
  }
}
