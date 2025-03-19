import 'package:flutter/material.dart';

class PlantDetailsScreen extends StatelessWidget {
  final String plantName;
  final Image plantImage;

  PlantDetailsScreen({required this.plantName, required this.plantImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plantName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          plantImage,
          SizedBox(height: 20),
          Text(
            plantName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Add more details here if needed
        ],
      ),
    );
  }
}
