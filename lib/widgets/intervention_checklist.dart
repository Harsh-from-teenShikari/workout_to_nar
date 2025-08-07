import 'package:flutter/material.dart';

class InterventionChecklist extends StatelessWidget {
  final List<String> items;
  final List<bool> checked;
  final ValueChanged<int> onChanged;

  const InterventionChecklist({
    required this.items,
    required this.checked,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => CheckboxListTile(
        title: Text(items[index]),
        value: checked[index],
        onChanged: (_) => onChanged(index),
      ),
    );
  }
}