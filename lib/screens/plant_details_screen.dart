import 'package:flutter/material.dart';

class PlantDetailScreen extends StatelessWidget {
  const PlantDetailScreen({super.key});
  static String screenRoute = 'plant_details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("strawberry")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/ss.png', height: 200),
           SizedBox(height: 16),
           Text("Age: 30 days"),
           Text("Humidity Level: 62%"),
          const Text("Status: Good",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
