import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/login.png"),
          fit: BoxFit.cover,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 20, 20, 20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 90),
            titleField("Email"),
            textField("email", controller: _emailController),
            SizedBox(height: 24),
            titleField("Password"),
            textField("password", controller: _passwordController),

            SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16.0),

              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.indigoAccent,
                borderRadius: BorderRadius.circular(50),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Login", style: TextStyle(fontSize: 24))],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField textField(
    String hintext, {
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        setState(() {});
      },

      obscuringCharacter: "*",
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        hintText: "Masukkan $hintext",
        prefixIcon: isPassword ? Icon(Icons.key) : Icon(Icons.email),
        suffixIcon: isPassword ? Icon(Icons.visibility) : null,
      ),
    );
  }

  Row titleField(String text) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
