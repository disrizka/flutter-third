// import 'package:flutter/material.dart';
// import 'package:thirdd/database/create.dart';
// import 'package:thirdd/database/database_instance.dart';
// import 'package:thirdd/database/identitas_model.dart';

// class Screenfirst extends StatefulWidget {
//   const Screenfirst({super.key});

//   @override
//   State<Screenfirst> createState() => _ScreenfirstState();
// }

// class _ScreenfirstState extends State<Screenfirst> {
//   DatabaseInstance databaseInstance = DatabaseInstance();

//   Future<void> _refresh() async {
//     setState(() {});
//   }

//   @override
//   void initState() {
//     databaseInstance.database();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("kontak"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (builder) {
//                     return CreateScreen();
//                   },
//                 ),
//               );
//             },
//             icon: Icon(Icons.add),
//           ),
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: _refresh(),
//         child: FutureBuilder<List<IdentitasModel>>(
//           future: databaseInstance.all(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               if (snapshot.data!.length == 0) {
//                 return Center(child: Text('data masih kosong'));
//               }
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     onTap: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const CreateScreen(),
//                         ),
//                       );
//                     },
//                     title: Text(snapshot.data![index].name ?? ''),
//                   );
//                 },
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(color: Colors.amber),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:thirdd/database/create.dart';
import 'package:thirdd/database/database_instance.dart';
import 'package:thirdd/database/identitas_model.dart';

class Screenfirst extends StatefulWidget {
  const Screenfirst({super.key});

  @override
  State<Screenfirst> createState() => _ScreenfirstState();
}

class _ScreenfirstState extends State<Screenfirst> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  Future<void> _refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    databaseInstance.database();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kontak"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateScreen()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<IdentitasModel>>(
          future: databaseInstance.all(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.amber),
              );
            }
            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return const Center(child: Text('Data masih kosong'));
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Terjadi kesalahan saat mengambil data'),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateScreen(),
                      ),
                    );
                  },
                  title: Text(snapshot.data![index].name ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snapshot.data![index].email ?? ''),
                      Text(snapshot.data![index].telepon ?? ''),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
