import 'package:autoponia_app/src/core/api_routes.dart';
import 'package:autoponia_app/src/modules/sprinker/models/sprinkler_model.dart';
import 'package:dio/dio.dart';

class SprinklerService {
  final Dio dio;
  SprinklerService(this.dio);

  Future<List<SprinklerModel>> fetch() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await dio.get(ApiRoutes.sprinklers);
      if (!(response.statusCode! >= 200 || response.statusCode! <= 204)) {
        throw Exception('Erro ao buscar sprinkler');
      }
      final list = response.data as List;
      final plants = list.map((e) => SprinklerModel.fromMap(e)).toList();

      return plants;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> create(SprinklerModel plant) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response =
          await dio.post(ApiRoutes.sprinklers, data: plant.toMap());
      if (!(response.statusCode! >= 200 || response.statusCode! <= 204)) {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(SprinklerModel sprinkler) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await dio.put(ApiRoutes.sprinklers + '/${sprinkler.id}',
          data: sprinkler.toMap());
      if (!(response.statusCode! >= 200 || response.statusCode! <= 204)) {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await dio.delete(ApiRoutes.sprinklers + '/$id');
      if (!(response.statusCode! >= 200 && response.statusCode! <= 204)) {
        throw Exception();
      }
    } catch (error) {
      rethrow;
    }
  }
}
