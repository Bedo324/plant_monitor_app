import 'package:flutter/material.dart';
import 'package:plant_monitor_app/screens/add_planet_screen.dart';
import 'package:plant_monitor_app/screens/plant_details_screen.dart'; 
import 'package:plant_monitor_app/models/plant_data.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Let's take care of your plants!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 3, 79, 6),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Consumer<PlantData>(
            builder: (context, plantData, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: plantData.plants.length,
                  itemBuilder: (context, index) {
                    final plant = plantData.plants[index];
                    return ListTile(
                      leading: SizedBox(width: 50, height: 50, child: plant.image),
                      title: Text(plant.name),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlantDetailsScreen(
                              plantName: plant.name,
                              plantImage: plant.image,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddPlantScreen.screenRoute);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
