import 'package:flutter/material.dart';
import '../models/room.dart';
import '../services/api_service.dart';

class RoomDetailScreen extends StatefulWidget {
  final Room room;

  const RoomDetailScreen({super.key, required this.room});

  @override
  State<RoomDetailScreen> createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  final messageController = TextEditingController();

  Future<void> bookRoom() async {
    try {
      await ApiService.bookRoom(
        roomId: widget.room.id,
        message: messageController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Booking request sent")),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Booking failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final room = widget.room;

    return Scaffold(
      appBar: AppBar(title: Text(room.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(room.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Location: ${room.location}"),
            Text("Price: Rs. ${room.price}"),
            Text("Owner: ${room.ownerName}"),
            const SizedBox(height: 20),
            Text(room.description),
            const SizedBox(height: 30),
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                labelText: "Message to owner",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: bookRoom,
                child: const Text("Book Room"),
              ),
            )
          ],
        ),
      ),
    );
  }
}