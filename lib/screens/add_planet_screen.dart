import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:plant_data';
import 'package:plant_monitor_app/models/plant_data.dart';
import 'package:provider/provider.dart';

class AddPlantScreen extends StatelessWidget {
  static String screenRoute = 'add_plant';

   final Function addPlantCallBack;

  AddPlantScreen(this.addPlantCallBack);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.indigo[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newPlantTitle = newText;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
              .addTask(newPlantTitle!);
              Navigator.pop(context);
            },
            child: Text('Add'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal[400],
            ),
          ),
        ],
      ),
    );
  }
}
