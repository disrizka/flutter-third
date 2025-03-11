// import 'package:flutter/material.dart';
// import 'package:thirdd/database/database_instance.dart';

// class CreateScreen extends StatefulWidget {
//   const CreateScreen({super.key});

//   @override
//   State<CreateScreen> createState() => _CreateScreenState();
// }

// class _CreateScreenState extends State<CreateScreen> {
//   DatabaseInstance databaseInstance = DatabaseInstance();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController teleponController = TextEditingController();

//   @override
//   void initState() {
//     databaseInstance.database();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('create')),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Text("Nama pengguna"),
//             TextField(controller: nameController),
//             Text('email'),
//             TextField(controller: emailController),
//             Text('telepon'),
//             TextField(controller: teleponController),
//             ElevatedButton(
//               onPressed: () async {
//                 await databaseInstance.insert({
//                   'name': nameController.text,
//                   'email': emailController.text,
//                   'telepon': teleponController.text,
//                   'created_at': DateTime.now().toString(),
//                   'updated_at': DateTime.now(),
//                 });
//                 Navigator.pop(context);
//                 setState(() {});
//               },
//               child: Text('submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:thirdd/database/database_instance.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController teleponController = TextEditingController();

  @override
  void initState() {
    super.initState();
    databaseInstance.database();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Nama Pengguna"),
            TextField(controller: nameController),
            const Text('Email'),
            TextField(controller: emailController),
            const Text('Telepon'),
            TextField(controller: teleponController),
            ElevatedButton(
              onPressed: () async {
                await databaseInstance.insert({
                  'name': nameController.text,
                  'email': emailController.text,
                  'telepon': teleponController.text,
                  'created_at': DateTime.now().toString(),
                  'updated_at': DateTime.now().toString(),
                });
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
