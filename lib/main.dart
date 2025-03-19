import 'package:flutter/material.dart';
import 'package:plant_monitor_app/models/plant_data.dart';
import 'package:plant_monitor_app/screens/add_planet_screen.dart';
import 'package:plant_monitor_app/screens/edit_profile_screen.dart';
import 'package:plant_monitor_app/screens/home_screen.dart';
import 'package:plant_monitor_app/screens/plant_details_screen.dart';
import 'package:plant_monitor_app/screens/register_screen.dart';
import 'package:plant_monitor_app/screens/signIn_screen.dart';
import 'package:plant_monitor_app/screens/tabs_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlantData(),
      child: MaterialApp(
        title: 'Plant Monitor',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        initialRoute: HomeScreen.screenRoute,
        routes: {
          HomeScreen.screenRoute: (context) => HomeScreen(),
          SigninScreen.screenRoute: (context) => SigninScreen(),
          RegisterScreen.screenRoute: (context) => RegisterScreen(),
          TabsScreen.screenRoute: (context) => TabsScreen(),
          AddPlantScreen.screenRoute: (context) => AddPlantScreen(),
          EditProfileScreen.screenRoute: (context) => EditProfileScreen(),
        },
      ),
    );
  }
}
