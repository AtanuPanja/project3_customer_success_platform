import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import '../utils/colors.dart';
import '../widgets/sort_popover.dart';

class SortButton extends StatefulWidget {
  const SortButton({
    super.key,
    required this.sortAsc,
    required this.sortDesc,
  });

  final VoidCallback sortAsc;
  final VoidCallback sortDesc;

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  @override
  Widget build(BuildContext context) {
    bool darkModeIsActive =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      child: const Row(
        children: [
          Icon(
            Icons.arrow_upward,
          ),
          Icon(
            Icons.arrow_downward,
          ),
        ],
      ),
      onTap: () {
        showPopover(
          backgroundColor: darkModeIsActive
              ? AppColors.appDarkBgColor
              : AppColors.appBgColor,
          context: context,
          bodyBuilder: (context) {
            return SortPopover(
              sortAsc: widget.sortAsc,
              sortDesc: widget.sortDesc,
            );
          },
          width: 300,
          height: 250,
          direction: PopoverDirection.bottom,
        );
        // setState(() {
        //   listOfProjects = listOfProjects.reversed.toList();
        // });
      },
    );
  }
}
