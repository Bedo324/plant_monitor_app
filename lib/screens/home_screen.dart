import 'package:flutter/material.dart';
import 'package:plant_monitor_app/screens/register_screen.dart';
import 'package:plant_monitor_app/screens/signIn_screen.dart';
import 'package:plant_monitor_app/widgets/mybottom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String screenRoute = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  child: Image.asset('images/icon.jpg!sw800'),
                ),
                Text('Plant Monitor',
            style: TextStyle(
              color: Colors.green,
              fontSize: 40,
            ),
            ),
              ],
            ),
            SizedBox(
              height: 28,
            ),
            MyButton(
              color: Colors.lightGreen, 
              title: 'sign in', 
              onPressed: (){
                Navigator.pushNamed(context, SigninScreen.screenRoute);
              }
              ),
            MyButton(
              color: const Color.fromARGB(255, 3, 79, 6), 
              title: 'create a new account', 
              onPressed: (){
                Navigator.pushNamed(context, RegisterScreen.screenRoute);
              }
              ),  
          ],
        ),
      ),
    );
  }
}