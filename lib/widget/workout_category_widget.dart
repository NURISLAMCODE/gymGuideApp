import 'package:flutter/material.dart';
import 'package:gym_guide_app/app_state.dart';
import 'package:gym_guide_app/data/exercise.dart';
import 'package:gym_guide_app/model/exercise_model.dart';
import 'package:gym_guide_app/pages/exercise_list_page.dart';
import 'package:gym_guide_app/model/workout_category_model.dart';
import 'package:gym_guide_app/pages/filter_page.dart';

class WorkoutCategoryWidgets extends StatelessWidget {
  static String routeName = "";
  final WorkoutCategoryModel workoutCategoryModel;
  const WorkoutCategoryWidgets({super.key, required this.workoutCategoryModel});

  @override
  Widget build(BuildContext context) {
    List<ExerciseModel> list = [];
    return Column(
      children: [
        InkWell(
          onTap: () {
            list = exerciseList
                .where((element) =>
                    element.category == workoutCategoryModel.categoryName)
                .toList()
                .where(
                    (element) => element.difficulty <= AppState.difficultyLevel)
                .toList();
            if (AppState.selectedEquipment == Equipment.equipment) {
              list = list
                  .where((element) => element.equipment.isNotEmpty)
                  .toList();
            } else if (AppState.selectedEquipment == Equipment.noEquipment) {
              list =
                  list.where((element) => element.equipment.isEmpty).toList();
            }
            Navigator.of(context)
                .pushNamed(ExerciseListPage.routeName, arguments: {
              'title': workoutCategoryModel.categoryName,
              'listOfExercise': list,
              //'arg2': workoutCategoryModel.imageSource
            });

            // push(MaterialPageRoute(
            //   builder: (context) {
            //     return ExerciseListPage(
            //       title: workoutCategoryModel.categoryName,
            //       imageSource: workoutCategoryModel.imageSource,
            //     );
            //   },
            // ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              child: Stack(
                children: [
                  Image.network(workoutCategoryModel.imageSource,
                      // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgB2EHKRG2ZYjOWWIqbk3l0IaI5aJt7rjoww&usqp=CAU",
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 40,
                      width: 400,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.transparent])),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            workoutCategoryModel.categoryName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
