import 'package:flutter/material.dart';
import 'escalation_matrix_table.dart';

class EscalationMatrix extends StatefulWidget {
  const EscalationMatrix({super.key});

  @override
  State<EscalationMatrix> createState() => _EscalationMatrixState();
}

class _EscalationMatrixState extends State<EscalationMatrix> {
  List<String> matrices = ['Operational', 'Financial', 'Technical'];
  List<String> tableHeaders = ['Escalation Level', 'Name', 'Role'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...matrices.map<Widget>(
          (matrixName) {
            return Column(
              children: [
                Text(
                  '$matrixName Escalation Matrix',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                EscalationMatrixTable(tableHeaders: tableHeaders),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
