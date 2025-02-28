import 'package:flutter/material.dart';
import 'package:thirdd/data/list_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500, // Lebar maksimum tiap item (200px)
        mainAxisSpacing: 10, // Jarak vertikal antar item
        crossAxisSpacing: 10, // Jarak horizontal antar item
        childAspectRatio: 8, // Perbandingan lebar-tinggi item
      ),
      itemCount: listName.length,
      itemBuilder: (context, index) {
        final item = listName[index];

        return Card(child: Center(child: Text(item)));
      },
    );
  }
}
