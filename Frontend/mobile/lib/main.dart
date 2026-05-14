import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_room_screen.dart';

void main() {
  runApp(const RoomRentalApp());
}

class RoomRentalApp extends StatelessWidget {
  const RoomRentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Room Rental Nepal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
      routes: {
        '/add-room': (context) => const AddRoomScreen(),
      },
    );
  }
}