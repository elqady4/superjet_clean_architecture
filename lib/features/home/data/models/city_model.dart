import '../../domain/entities/city_entitie.dart';

class CityModel extends CityEntity {
  const CityModel({required super.id, required super.name});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      CityModel(id: json["Id"], name: json["Name"]);

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
      };
}
