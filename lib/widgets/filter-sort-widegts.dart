// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class FilterSortWidget extends StatelessWidget {
  final Function(String) onFilterChanged;
  final Function(String) onSortChanged;

  FilterSortWidget({required this.onFilterChanged, required this.onSortChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter Section
        DropdownButton<String>(
          hint: Text("Filter by Brand"),
          items: ['Dell', 'HP', 'Apple', 'Asus'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            onFilterChanged(newValue!);
          },
        ),
        // Sort Section
        DropdownButton<String>(
          hint: Text("Sort by"),
          items: ['Price: Low to High', 'Price: High to Low', 'Rating: High to Low']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            onSortChanged(newValue!);
          },
        ),
      ],
    );
  }
}
