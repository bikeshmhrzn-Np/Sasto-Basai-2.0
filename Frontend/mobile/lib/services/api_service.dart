import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/room.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000/api";

  static Future<List<Room>> fetchRooms() async {
    final response = await http.get(Uri.parse("$baseUrl/rooms/"));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((room) => Room.fromJson(room)).toList();
    } else {
      throw Exception("Failed to load rooms");
    }
  }

  static Future<void> addRoom({
    required String title,
    required String description,
    required String location,
    required String price,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/rooms/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
        "description": description,
        "location": location,
        "price": price,
        "is_available": true,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to add room");
    }
  }

  static Future<void> bookRoom({
    required int roomId,
    required String message,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/book-room/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "room": roomId,
        "message": message,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to book room");
    }
  }
}