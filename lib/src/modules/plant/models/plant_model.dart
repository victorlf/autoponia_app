class PlantModel {
  final String id;
  final String name;
  final String watering;
  final int dosage;
  final int humidity;
  final int temperature;
  PlantModel({
    this.id = '',
    required this.name,
    required this.watering,
    required this.dosage,
    required this.humidity,
    required this.temperature,
  });

  PlantModel copyWith({
    String? id,
    String? name,
    String? watering,
    int? dosage,
    int? humidity,
    int? temperature,
  }) {
    return PlantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      watering: watering ?? this.watering,
      dosage: dosage ?? this.dosage,
      humidity: humidity ?? this.humidity,
      temperature: temperature ?? this.temperature,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'watering_id': watering,
      'dosage': dosage,
      'humidity': humidity,
      'temperature': temperature,
    };
  }

  factory PlantModel.fromMap(Map<String, dynamic> map) {
    return PlantModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      watering: map['watering_id'] ?? '',
      dosage: map['dosage']?.toInt() ?? 0,
      humidity: map['humidity']?.toInt() ?? 0,
      temperature: map['temperature']?.toInt() ?? 0,
    );
  }
}
