class Reservation {
  String RoomId;
  String UserId;
  DateTime DateInitial;
  DateTime DateEnd;

  Reservation({this.RoomId, this.UserId, this.DateInitial, this.DateEnd});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return new Reservation(
      RoomId: json['RoomId'] as String,
      UserId: json['UserId'] as String,
      DateInitial: json['DateInitial'] as DateTime,
      DateEnd: json['DateEnd'] as DateTime
    );
  }
}