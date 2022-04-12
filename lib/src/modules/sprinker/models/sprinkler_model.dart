import 'dart:convert';

class SprinklerModel {
  final String? id;
  final String name;
  final int duration;
  final String lastDosage;
  final bool isSourceOk;

  SprinklerModel({
    this.id = '',
    required this.name,
    required this.duration,
    required this.lastDosage,
    required this.isSourceOk,
  });

  SprinklerModel copyWith({
    String? id,
    String? name,
    int? duration,
    String? lastDosage,
    bool? isSourceOk,
  }) {
    return SprinklerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      duration: duration ?? this.duration,
      lastDosage: lastDosage ?? this.lastDosage,
      isSourceOk: isSourceOk ?? this.isSourceOk,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dosage_duration': duration,
      'last_dosage': lastDosage,
      'water_source_ok': isSourceOk,
    };
  }

  factory SprinklerModel.fromMap(Map<String, dynamic> map) {
    return SprinklerModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      duration: map['dosage_duration']?.toInt() ?? 0,
      lastDosage: map['last_dosage'] ?? '',
      isSourceOk: map['water_source_ok'] ?? false,
    );
  }
}
