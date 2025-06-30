class CollegeModel {
  int? id;
  String? name;
  int? unversityid;
  dynamic universities;

  CollegeModel({this.id, this.name, this.unversityid, this.universities});

  factory CollegeModel.fromJson(Map<String, dynamic> json) => CollegeModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        unversityid: json['unversityid'] as int?,
        universities: json['universities'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'unversityid': unversityid,
        'universities': universities,
      };
}
