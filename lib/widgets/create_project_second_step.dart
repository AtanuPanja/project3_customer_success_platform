import "package:flutter/material.dart";

class CreateProjectSecondStep extends StatelessWidget {
  const CreateProjectSecondStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Client name'),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade700,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'Name here',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text('Client email'),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade700,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: 'example@work.com',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            overlayColor: MaterialStateProperty.all(
                const Color.fromARGB(45, 0, 113, 234)),
          ),
          child: const Row(
            children: [
              Icon(Icons.add),
              Text('Add'),
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}