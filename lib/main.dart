
import 'package:flutter/material.dart';
import 'package:plant_monitor_app/screens/home_screen.dart';
import 'package:plant_monitor_app/screens/plant_details_screen.dart';
import 'package:plant_monitor_app/screens/register_screen.dart';
import 'package:plant_monitor_app/screens/signIn_screen.dart';
import 'package:plant_monitor_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        PlantDetailScreen.screenRoute: (context) => PlantDetailScreen(),
      },
    );
  }
}

