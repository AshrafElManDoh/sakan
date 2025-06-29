class UniversityModel {
  int? id;
  String? name;
  String? location;

  UniversityModel({this.id, this.name, this.location});

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      location: json['location'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'location': location,
      };
}
