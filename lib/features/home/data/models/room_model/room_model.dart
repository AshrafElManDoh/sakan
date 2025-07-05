class RoomModel {
  int? id;
  int? pricePerMonth;
  String? description;
  dynamic imageFiles;
  List<String>? imagePaths;
  String? title;
  bool? isAvailable;
  int? apartmentId;

  RoomModel({
    this.id,
    this.pricePerMonth,
    this.description,
    this.imageFiles,
    this.imagePaths,
    this.title,
    this.isAvailable,
    this.apartmentId,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        id: json['id'] as int?,
        pricePerMonth: json['pricePerMonth'] as int?,
        description: json['description'] as String?,
        imageFiles: json['imageFiles'] as dynamic,
        imagePaths: (json['imagePaths'] as List<dynamic>?)?.cast<String>(),
        title: json['title'] as String?,
        isAvailable: json['isAvailable'] as bool?,
        apartmentId: json['apartmentId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'pricePerMonth': pricePerMonth,
        'description': description,
        'imageFiles': imageFiles,
        'imagePaths': imagePaths,
        'title': title,
        'isAvailable': isAvailable,
        'apartmentId': apartmentId,
      };
}
