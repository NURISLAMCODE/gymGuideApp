import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gym_guide_app/model/exercise_model.dart';
import 'package:collection/collection.dart';

class ExerciseDetailsPage extends StatelessWidget {
  static String routeName = "/exerciseDetailsPage";
  const ExerciseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exerciseModel =
        ModalRoute.of(context)!.settings.arguments as ExerciseModel;
    //log("${exerciseModel}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise Details"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.grey[100],
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: ListView(
          children: [
            //Image.network(exerciseModel.imageUrl),
            CachedNetworkImage(
                imageUrl: exerciseModel.imageUrl,
                color: Colors.grey.withOpacity(0.1),
                colorBlendMode: BlendMode.darken,
                height: 200,
                width: double.infinity,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                      //height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                fit: BoxFit.cover),
            Text(
              exerciseModel.name,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Divider(
              color: Colors.black,
            ),
            ...exerciseModel.steps.mapIndexed(
              (index, e) => ListTile(
                leading: CircleAvatar(
                  child: Text(
                    (index + 1).toString(),
                  ),
                ),
                title: Text(e),

                // leading: Text(e),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Targeted Muscle",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Row(
              children: exerciseModel.targetMuscles
                  .map(
                    (e) => Card(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Equipment",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Row(
              children: exerciseModel.equipment
                  .map(
                    (e) => Card(
                      color: Colors.blue[400],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.repeat,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      exerciseModel.sets,
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.fitness_center,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      exerciseModel.reps,
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.timer,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      exerciseModel.duration,
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                )
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
