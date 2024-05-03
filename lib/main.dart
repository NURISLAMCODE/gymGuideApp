import 'package:flutter/material.dart';
import 'package:gym_guide_app/pages/bmi_calculator_page.dart';
import 'package:gym_guide_app/pages/exercise_details_page.dart';
import 'package:gym_guide_app/pages/filter_page.dart';
import 'package:gym_guide_app/pages/my_home_page.dart';
import 'package:gym_guide_app/pages/exercise_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xFF322751),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF322751),
          ),
          primarySwatch: Colors.blue),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
        ExerciseListPage.routeName: (context) => const ExerciseListPage(),
        ExerciseDetailsPage.routeName: (context) => const ExerciseDetailsPage(),
        BMICalculatorPage.routeName: (context) => const BMICalculatorPage(),
        FilterPage.routeName: (context) => const FilterPage(),
      },
      // home: const MyHomePage(),
    );
  }
}
