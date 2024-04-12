import 'package:flutter/material.dart';

class ProjectOverview extends StatelessWidget {
  const ProjectOverview({
    super.key, 
    required this.overview, 
    required this.overviewController,
    required this.budgetValue, 
    required this.budgetValueController,
  });

  final String? overview;
  final TextEditingController overviewController;
  final String? budgetValue;
  final TextEditingController budgetValueController;

  @override
  Widget build(BuildContext context) {

    overviewController.text = overview ?? '';
    budgetValueController.text = budgetValue ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Project brief'),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: overviewController,
          maxLines: 5,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 0.5,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write project brief here',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text('Purpose'),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 0.5,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write project purpose here',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text('Goals'),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 0.5,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write project goals here',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text('Objectives'),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 0.5,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Write project objectives here',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text('Budget'),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            TextFormField(
              controller: budgetValueController,
              decoration: InputDecoration(
                constraints: const BoxConstraints(
                  maxWidth: 100,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade500,
                    width: 0.5,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                hintText: '9999',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text('US Dollar'),
          ],
        ),
      ],
    );
  }
}
