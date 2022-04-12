import 'package:autoponia_app/src/modules/sprinker/cubits/sprinkler_state.dart';
import 'package:autoponia_app/src/modules/sprinker/models/sprinkler_model.dart';
import 'package:autoponia_app/src/modules/sprinker/services/sprinkler_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SprinklerCubit extends Cubit<SprinklerState> {
  final SprinklerService _sprinklerService;
  SprinklerCubit(this._sprinklerService) : super(IdleSprinklerState());

  List<SprinklerModel> _sprinklers = [];

  List<SprinklerModel> get sprinklers =>
      List<SprinklerModel>.unmodifiable(_sprinklers);

  Future<void> fetchAll() async {
    emit(LoadingSprinklerState());
    try {
      _sprinklers = await _sprinklerService.fetch();
      if (_sprinklers.isEmpty) {
        emit(NoDataSprinklerState());
      } else {
        emit(SuccessSprinklerState(_sprinklers));
      }
    } catch (e) {
      emit(ErrorSprinklerState(e.toString()));
    }
  }

  Future<void> create(SprinklerModel sprinkler) async {
    emit(LoadingSprinklerState());
    try {
      await _sprinklerService.create(sprinkler);

      emit(SuccessSprinklerState(_sprinklers));
    } catch (e) {
      emit(ErrorSprinklerState(''));
    }
  }

  Future<void> update(SprinklerModel sprinkler) async {
    emit(LoadingSprinklerState());
    try {
      await _sprinklerService.update(sprinkler);

      emit(SuccessSprinklerState(_sprinklers));
    } catch (e) {
      emit(ErrorSprinklerState(''));
    }
  }

  Future<void> delete(SprinklerModel sprinkler) async {
    emit(LoadingSprinklerState());
    try {
      await _sprinklerService.delete(sprinkler.id!);

      emit(SuccessSprinklerState(_sprinklers));
    } catch (e) {
      emit(ErrorSprinklerState(''));
    }
  }
}
