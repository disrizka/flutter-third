import 'package:flutter/material.dart';
import 'package:thirdd/database/ScreenFirst.dart';
import 'package:thirdd/database/create.dart';
import 'package:thirdd/database/database_instance.dart';
import 'package:thirdd/database/identitas_model.dart';
import 'package:thirdd/main/home/home_screen.dart';
import 'package:thirdd/main/kontak/kontak_screen.dart';
import 'package:thirdd/main/profile/profile_screen.dart';
import 'package:thirdd/main/stack/widgets/expanded.dart';
import 'package:thirdd/views/auth/login_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.email, required this.phone});
  final String email;
  final String phone;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // static const List<Widget> _widgetOptions = <Widget>[
  //   HomeScreen(email: widget.email,),
  //   KontakScreen(),
  //   ProfileScreen(),
  //   ExpandedScreen(),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      HomeScreen(email: widget.email, phone: widget.phone),
      KontakScreen(),
      ProfileScreen(),
      ExpandedScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 210, 15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/eizka.jpeg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Lutfiah Rizka",
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text('Contacts'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            // SizedBox(height: 20),
            // FutureBuilder<List<IdentitasModel>>(
            //   future: databaseInstance.all(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       if (snapshot.data!.length == 0) {
            //         return Center(child: Text('data masih kosong'));
            //       }
            //       return ListView.builder(
            //         itemCount: snapshot.data!.length,
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //             onTap: () {
            //               Navigator.pushReplacement(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => const CreateScreen(),
            //                 ),
            //               );
            //             },
            //             title: Text(snapshot.data![index].name ?? ''),
            //           );
            //         },
            //       );
            //     } else {
            //       return Center(
            //         child: CircularProgressIndicator(color: Colors.amber),
            //       );
            //     }
            //   },
            // ),
            SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.contact_emergency, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              selected: _selectedIndex == 3,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Screenfirst()),
                );
              },
            ),

            SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              selected: _selectedIndex == 3,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Kontak'),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'My Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart),
            label: 'Stack',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
