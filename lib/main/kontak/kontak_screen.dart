import 'package:flutter/material.dart';
import 'package:thirdd/data/grid_data.dart';

class KontakScreen extends StatelessWidget {
  const KontakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: gridData.length,
      itemBuilder: (context, index) {
        final item = gridData[index];

        return Card(
          color: item.color,
          child: Center(child: Text(item.name)), // Contoh penggunaan data
        ); // gridData berasal dari grid_data.dart
      },
    );
  }
}
