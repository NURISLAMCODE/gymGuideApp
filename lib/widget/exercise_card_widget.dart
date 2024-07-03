import 'package:flutter/material.dart';
import 'package:gym_guide_app/app_state.dart';
import 'package:gym_guide_app/model/exercise_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gym_guide_app/pages/exercise_details_page.dart';
import 'package:gym_guide_app/pages/filter_page.dart';

class ExerciseCardWidget extends StatelessWidget {
  final ExerciseModel exreciseModel;
  const ExerciseCardWidget({super.key, required this.exreciseModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ExerciseDetailsPage.routeName, arguments: exreciseModel);
      },
      child: Container(
        height: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 4,
              color: Colors.grey.withOpacity(0.1),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              child: CachedNetworkImage(
                  imageUrl: exreciseModel.imageUrl,
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
              // Image.network(
              //   exreciseModel.imageUrl,
              //   width: double.infinity,
              //   height: 180,
              //   fit: BoxFit.cover,
              // ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    exreciseModel.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index + 1 <= exreciseModel.difficulty
                          ? Icons.star
                          : Icons.star_border,
                      size: 15,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: AppState.selectedEquipment == Equipment.noEquipment
                  ? Text(
                      "No Equipment: ${exreciseModel.equipment.join(", ")}",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  : Text(
                      "Equipment: ${exreciseModel.equipment.join(", ")}",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
