import 'package:flutter/material.dart';
import 'package:thirdd/main/stack/widgets/expanded.dart';
import 'package:thirdd/main/stack/widgets/griview.dart';
import 'package:thirdd/service/pref_handler.dart';
import 'package:thirdd/utils/constant/app_color.dart';
import 'package:thirdd/views/auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _selectedItem = 'Grid';
  bool isDark = false;

  void _onItemTapped(String item) {
    setState(() {
      _selectedItem = item;
    });
  }

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.primaryColor,
    primarySwatch: Colors.amber,
  );
  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.secondaryColor,
    primarySwatch: Colors.deepPurple,
  );
  @override
  Widget build(BuildContext context) {
    theme:
    isDark ? dark : light;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Profile'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Text(
                'Layouting',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            titleConst("Layouting"),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Expanded'),
              onTap: () {
                _onItemTapped('Expanded');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Grid'),
              onTap: () {
                _onItemTapped('Grid');
              },
            ),
            titleConst("Input"),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('TextField'),
              onTap: () {
                _onItemTapped('TextField');
              },
            ),
            titleConst("Event"),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Button'),
              onTap: () {
                _onItemTapped('Button');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                PreferenceHandler.removeId();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.color_lens),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedItem) {
      case 'Expanded':
        return ExpandedScreen();
      case 'Grid':
        return GridviewScreen();
      case 'Logout':
        return Center(
          child: Text('Logout Screen', style: TextStyle(fontSize: 24)),
        );
      default:
        return Center(
          child: Text('Profile Screen', style: TextStyle(fontSize: 24)),
        );
    }
  }
}

Text titleConst(String text) => Text(text, style: TextStyle(fontSize: 24));
