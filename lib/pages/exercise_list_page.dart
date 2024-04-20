import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:gym_guide_app/model/exercise_model.dart';
import 'package:gym_guide_app/pages/exercise_details_page.dart';
import 'package:gym_guide_app/widget/exercise_card_widget.dart';

class ExerciseListPage extends StatelessWidget {
  static String routeName = "ExerciseListPage";

  const ExerciseListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log("${ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>}");
    //final ExerciseModel exreciseModel = exerciseList[0];
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = args['title'];
    final List<ExerciseModel> listOfExrecise = args['listOfExercise'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: listOfExrecise.length,
            itemBuilder: (context, index) {
              return ExerciseCardWidget(
                exreciseModel: listOfExrecise[index],
              );
            },
            separatorBuilder: ((context, index) {
              return const SizedBox(
                height: 20,
              );
            }),
          ),
        ),
      ),
    );
  }
}
