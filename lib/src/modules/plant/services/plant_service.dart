import 'package:autoponia_app/src/core/api_routes.dart';
import 'package:autoponia_app/src/modules/plant/models/plant_model.dart';
import 'package:dio/dio.dart';

class PlantService {
  final Dio dio;
  PlantService(this.dio);

  Future<List<PlantModel>> fetch() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await dio.get(ApiRoutes.plants);
      if (!(response.statusCode! >= 200 || response.statusCode! <= 204)) {
        throw Exception();
      }
      final list = response.data as List;
      final plants = list.map((e) => PlantModel.fromMap(e)).toList();

      return plants;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> create(PlantModel plant) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await dio.post(ApiRoutes.plants, data: plant.toMap());
      if (!(response.statusCode! >= 200 || response.statusCode! <= 204)) {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(PlantModel plant) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response =
          await dio.put(ApiRoutes.plants + '/${plant.id}', data: plant.toMap());
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
      final response = await dio.delete(ApiRoutes.plants + '/$id');
      if (!(response.statusCode! >= 200 && response.statusCode! <= 204)) {
        throw Exception();
      }
    } catch (error) {
      rethrow;
    }
  }
}
