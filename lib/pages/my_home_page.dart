import 'package:flutter/material.dart';
import 'package:gym_guide_app/data/exercise.dart';

import 'package:gym_guide_app/data/widget_category_list.dart';
import 'package:gym_guide_app/pages/bmi_cal_page.dart';
import 'package:gym_guide_app/pages/filter_page.dart';
import 'package:gym_guide_app/widget/exercise_card_widget.dart';
import 'package:gym_guide_app/widget/workout_category_widget.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = "MyHomePage";
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              color: const Color(0xFF322751),
              child: const Padding(
                padding: EdgeInsets.only(top: 50, left: 30),
                child: Text(
                  "GYM GUIDE",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "BMI CALCULATOR",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BMICalPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                "Filter",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FilterPage()),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _index = value;
          setState(() {});
        },
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            label: "Category",
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text(
          "Welcome Nur",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/raj.jpg"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              _index == 0 ? "WorkOut Categories" : "Favourite Exercise",
              style: const TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            _index == 0
                ? Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => WorkoutCategoryWidgets(
                        workoutCategoryModel: workoutCategoryList[index],
                      ),
                      itemCount: workoutCategoryList.length,
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ExerciseCardWidget(
                            exreciseModel: exerciseList
                                .where((element) => element.isFavourite)
                                .toList()[index],
                          );
                        },
                        itemCount: exerciseList
                            .where((element) => element.isFavourite)
                            .toList()
                            .length),
                  ),
          ],
        ),
      ),
    );
  }
}
