class ApartmentModel {
  int? id;
  int? pricePerMonthdto;
  String? descriptiondto;
  dynamic imageFiles;
  List<String>? imagePaths;
  String? titledto;
  String? locationdto;
  double? latitudedto;
  double? longitudedto;
  int? ownerId;

  ApartmentModel({
    this.id,
    this.pricePerMonthdto,
    this.descriptiondto,
    this.imageFiles,
    this.imagePaths,
    this.titledto,
    this.locationdto,
    this.latitudedto,
    this.longitudedto,
    this.ownerId,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) {
    return ApartmentModel(
      id: json['id'] as int?,
      pricePerMonthdto: json['pricePerMonthdto'] as int?,
      descriptiondto: json['descriptiondto'] as String?,
      imageFiles: json['imageFiles'] as dynamic,
      imagePaths: (json['imagePaths'] as List<dynamic>?)?.cast<String>(),
      titledto: json['titledto'] as String?,
      locationdto: json['locationdto'] as String?,
      latitudedto: (json['latitudedto'] as num?)?.toDouble(),
      longitudedto: (json['longitudedto'] as num?)?.toDouble(),
      ownerId: json['owner_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'pricePerMonthdto': pricePerMonthdto,
        'descriptiondto': descriptiondto,
        'imageFiles': imageFiles,
        'imagePaths': imagePaths,
        'titledto': titledto,
        'locationdto': locationdto,
        'latitudedto': latitudedto,
        'longitudedto': longitudedto,
        'owner_id': ownerId,
      };
}
