import 'package:flutter/material.dart';

class SortPopover extends StatefulWidget {
  const SortPopover({
    super.key,
    required this.sortAsc,
    required this.sortDesc,
  });

  final VoidCallback sortAsc;
  final VoidCallback sortDesc;

  @override
  State<SortPopover> createState() => _SortPopoverState();
}

class _SortPopoverState extends State<SortPopover> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sort by members'),
              Text('Ascending'),
            ],
          ),
          onTap: () {
            widget.sortAsc();
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sort by members'),
              Text('Descending'),
            ],
          ),
          onTap: () {
            widget.sortDesc();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
