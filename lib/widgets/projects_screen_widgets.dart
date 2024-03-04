import 'package:flutter/material.dart';

class ProjectsCardDisplay extends StatelessWidget {
  const ProjectsCardDisplay({
    super.key,
    required this.count,
    required this.type,
  });

  final String count;
  final String type;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth / 1.6,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0,),
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade700,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            type,
          ),
        ],
      ),
    );
  }
}
