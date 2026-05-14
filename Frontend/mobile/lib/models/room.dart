class Room {
  final int id;
  final String title;
  final String description;
  final String location;
  final String price;
  final String? image;
  final String ownerName;

  Room({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    this.image,
    required this.ownerName,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      price: json['price'].toString(),
      image: json['image'],
      ownerName: json['owner_name'] ?? '',
    );
  }
}