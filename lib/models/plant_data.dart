import 'package:flutter/material.dart';
import 'package:plant_monitor_app/models/plant.dart';

class PlantData extends ChangeNotifier {
  List<Plant> plants = [
    Plant(name: 'strawberry', image: Image.asset('images/ss.png')),
  ];

  void addPlant(String newPlantTitle ,Image newPlantImage) {
    plants.add(Plant(name: newPlantTitle , image: newPlantImage));
    notifyListeners();
  }

  void deletePlant(Plant plant) {
    plants.remove(plant);
    notifyListeners();
  }
}
