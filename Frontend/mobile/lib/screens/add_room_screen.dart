import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({super.key});

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final priceController = TextEditingController();

  Future<void> submitRoom() async {
    try {
      await ApiService.addRoom(
        title: titleController.text,
        description: descriptionController.text,
        location: locationController.text,
        price: priceController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Room added successfully")),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to add room")),
      );
    }
  }

  Widget input(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Room"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            input(titleController, "Room title"),
            input(descriptionController, "Description"),
            input(locationController, "Location"),
            input(priceController, "Price"),
            ElevatedButton(
              onPressed: submitRoom,
              child: const Text("Post Room"),
            ),
          ],
        ),
      ),
    );
  }
}