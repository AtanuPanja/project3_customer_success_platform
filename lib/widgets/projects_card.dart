import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ProjectsCard extends StatelessWidget {
  const ProjectsCard({
    super.key,
    required this.count,
    required this.type,
  });

  final String count;
  final String type;

  @override
  Widget build(BuildContext context) {
    bool darkModeIsActive =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth / 5,
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.cardBorderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.0),
        color:
            darkModeIsActive ? AppColors.appDarkBgColor : AppColors.appBgColor,
      ),
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            type,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
