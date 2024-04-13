import 'package:flutter/material.dart';

// This widget creates the breadcrumbs display
// Clicking on the Projects, we can again navigate back to the projects page
class BreadCrumbs extends StatelessWidget {
  final String projectName;
  const BreadCrumbs({
    super.key,
    required this.projectName,
  });

  @override
  Widget build(BuildContext context) {
    return 
        Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Row(
            children: [
              Icon(
                Icons.card_travel_rounded,
                size: 12,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                'Projects',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.business_center_outlined,
              size: 12,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              projectName,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
            ),
          ],
        ),
      ],
    );
  }
}
