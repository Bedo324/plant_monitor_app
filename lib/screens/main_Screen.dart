import 'package:flutter/material.dart';
import 'package:plant_monitor_app/screens/add_planet_screen.dart';
import 'package:plant_monitor_app/screens/plant_details_screen.dart';
import 'package:plant_monitor_app/widgets/plant_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 118),
              child: Text("Hey, Let's grow your plant",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 500,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return PlantCard(
                    name: [
                      'strawberry 1',
                      'strawberry 2',
                      'strawberry 3',
                      'strawberry 4'
                    ][index],
                    image: 'images/ss.png',
                    onTap: () {
                      Navigator.pushNamed(context, PlantDetailScreen.screenRoute);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddPlantScreen.screenRoute);
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      
    );
  }
}
