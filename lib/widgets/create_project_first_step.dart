import 'package:flutter/material.dart';

class CreateProjectFirstStep extends StatefulWidget {
  const CreateProjectFirstStep({
    super.key,
    required GlobalKey<FormState> firstFormKey,
    required this.projectNameFocus,
    required this.projectNameController,
  }) : _firstFormKey = firstFormKey;

  final GlobalKey<FormState> _firstFormKey;
  final FocusNode projectNameFocus;
  final TextEditingController projectNameController;

  @override
  State<CreateProjectFirstStep> createState() => _CreateProjectFirstStepState();
}

class _CreateProjectFirstStepState extends State<CreateProjectFirstStep> {
  List<Map<String, String>> formOptionalFields = [
    {'label': 'Project brief', 'placeholder': 'Write project brief here'},
    {'label': 'Purpose', 'placeholder': 'Write project purpose here'},
    {'label': 'Goals', 'placeholder': 'Write project goals here'},
    {'label': 'Objectives', 'placeholder': 'Write project objectives here'},
    {'label': 'Objectives', 'placeholder': 'Write project objectives here'},
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._firstFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Project name *'),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                focusNode: widget.projectNameFocus,
                controller: widget.projectNameController,
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
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  hintText: 'Placeholder text here',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    widget.projectNameFocus.requestFocus();
                    return "The project name can't be empty";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ],
          ),
          ...formOptionalFields.map<Column>((formOptionalField) {
            return Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(formOptionalField['label'] ?? 'Project brief'),
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
                        hintText: formOptionalField['placeholder'],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
