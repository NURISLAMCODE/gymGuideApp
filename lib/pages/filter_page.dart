import 'package:flutter/material.dart';
import 'package:gym_guide_app/app_state.dart';

enum Equipment { noEquipment, equipment, both }

class FilterPage extends StatefulWidget {
  static String routeName = "/filter";
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Filter",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const ListTile(
            title: Text("Equipment"),
            leading: Icon(Icons.fitness_center),
          ),
          RadioListTile(
            title: Text("Equipment"),
            value: Equipment.equipment,
            groupValue: AppState.selectedEquipment,
            onChanged: (value) {
              AppState.selectedEquipment = value!;
              setState(() {});
            },
          ),
          RadioListTile(
            title: Text("noEqipment"),
            value: Equipment.noEquipment,
            groupValue: AppState.selectedEquipment,
            onChanged: (value) {
              AppState.selectedEquipment = value!;
              setState(() {});
            },
          ),
          RadioListTile(
            title: Text("Both"),
            value: Equipment.both,
            groupValue: AppState.selectedEquipment,
            onChanged: (value) {
              AppState.selectedEquipment = value!;
              setState(() {});
            },
          ),
          ListTile(
            title: Text("Difficulty level"),
            leading: Icon(Icons.work_history),
          ),
          Slider(
            divisions: 4,
            value: AppState.difficultyLevel,
            onChanged: (value) {
              AppState.difficultyLevel = value;
              setState(() {});
            },
            label: "Difficulty level ${AppState.difficultyLevel}",
            max: 5,
            min: 1,
          )
        ],
      ),
    );
  }
}
