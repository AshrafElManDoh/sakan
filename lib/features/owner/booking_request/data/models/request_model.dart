class BookingRequestModel {
  final String roomName;
  final String apartmentName;
  final String price;
  final String residentName;
  final String residentImage;
  final String roomImage;
  final DateTime date;
  final String status;

  BookingRequestModel({
    required this.roomName,
    required this.apartmentName,
    required this.price,
    required this.residentName,
    required this.residentImage,
    required this.roomImage,
    required this.date,
    required this.status,
  });

  // Optional: fromJson / toJson if you're dealing with APIs
  factory BookingRequestModel.fromJson(Map<String, dynamic> json) {
    return BookingRequestModel(
      roomName: json['roomName'],
      apartmentName: json['apartmentName'],
      price: json['price'],
      residentName: json['residentName'],
      residentImage: json['residentImage'],
      roomImage: json['roomImage'],
      date: DateTime.parse(json['date']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomName': roomName,
      'apartmentName': apartmentName,
      'price': price,
      'residentName': residentName,
      'residentImage': residentImage,
      'roomImage': roomImage,
      'date': date.toIso8601String(),
      'status': status,
    };
  }
}
