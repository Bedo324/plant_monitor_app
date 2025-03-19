import 'package:flutter/material.dart';
import 'package:plant_monitor_app/screens/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              backgroundImage: AssetImage('images/p.png'),
            ),
            const SizedBox(height: 16),
            const Text("Ravibx", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Plant Enthusiast", style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, EditProfileScreen.screenRoute);
              },
              child: const Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }
}