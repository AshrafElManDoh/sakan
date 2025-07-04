class IdCardModel {
  String? firstName;
  String? lastName;
  String? nationalId;
  String? address;

  IdCardModel({
    this.firstName,
    this.lastName,
    this.nationalId,
    this.address,
  });

  factory IdCardModel.fromJson(Map<String, dynamic> json) => IdCardModel(
        firstName: json['الاسم الاول'] as String?,
        lastName: json['الاسم الثاني'] as String?,
        nationalId: json['الرقم القومي'] as String?,
        address: json['العنوان'] as String?,
      );
}
