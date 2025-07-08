class AiResponseModel {
  String? estimatedAreaSqm;
  String? floorType;
  String? mainItems;
  String? naturalLight;
  String? rentalTips;
  String? roomType;
  String? ventilation;
  String? wallCondition;
  String? windowView;

  AiResponseModel({
    this.estimatedAreaSqm,
    this.floorType,
    this.mainItems,
    this.naturalLight,
    this.rentalTips,
    this.roomType,
    this.ventilation,
    this.wallCondition,
    this.windowView,
  });

  factory AiResponseModel.fromJson(Map<String, dynamic> json) =>
      AiResponseModel(
        estimatedAreaSqm: json['estimated_area_sqm'] as String?,
        floorType: json['floor_type'] as String?,
        mainItems: json['main_items'] as String?,
        naturalLight: json['natural_light'] as String?,
        rentalTips: json['rental_tips'] as String?,
        roomType: json['room_type'] as String?,
        ventilation: json['ventilation'] as String?,
        wallCondition: json['wall_condition'] as String?,
        windowView: json['window_view'] as String?,
      );
}
