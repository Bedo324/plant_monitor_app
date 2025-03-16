import 'package:flutter/material.dart';
import 'package:plant_monitor_app/models/plant.dart';

class TaskData extends ChangeNotifier {
  List<Plant> plants = [
    Plant(name: 'strawberry1'),
    Plant(name: 'strawberry2'),
    Plant(name: 'strawberry3'),
    Plant(name: 'strawberry4'),
  ];

  void addTask(String newPlantTitle) {
    plants.add(Plant(name: newPlantTitle));
    notifyListeners();
  }

  void deleteTask(Plant plant) {
    plants.remove(plant);
    notifyListeners();
  }
}
