class Room {
  String name;
  String description;
  int floor;
  int maxPeople;
  bool hasTv;
  bool hasPainting;

  Room({this.name, this.description, this.floor, this.maxPeople, this.hasTv, this.hasPainting});

  factory Room.fromJson(Map<String, dynamic> json) {
    return new Room(
      name: json['name'] as String,
      description: json['description'] as String,
      maxPeople: json['maxPeople'] as int,
      floor: json['floor'] as int,
      hasTv: json['hasTv'] as bool,
      hasPainting: json['hasPainting'] as bool,
    );
  }
}