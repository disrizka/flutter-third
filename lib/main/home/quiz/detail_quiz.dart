import 'package:flutter/material.dart';
import 'package:thirdd/main/home/quiz/coba.dart';

class DetailQuiz extends StatelessWidget {
  const DetailQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/LoginScreen.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
          ),

          Positioned(
            top: 173,
            child: ClipOval(
              child: Container(
                width: 160,
                height: 160,
                child: Image.asset('assets/logo.png', fit: BoxFit.cover),
              ),
            ),
          ),

          /// enter yiur name
          Positioned(
            top: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                //john doe
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "John Doe...",
                      filled: true,
                      fillColor: const Color.fromARGB(255, 247, 247, 247),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///login
          Positioned(
            bottom: 140,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CobaQuiz()),
                );
              },

              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CobaQuiz()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "star",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:thirdd/main/home/quiz/coba.dart';

// class DetailQuiz extends StatelessWidget {
//   const DetailQuiz({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           Image.asset(
//             "assets/LoginScreen.png",
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height,
//           ),
//           Positioned(
//             top: 173,
//             left: 135,
//             child: Container(
//               width: 160,
//               height: 160,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       "QUIZ",
//                       style: TextStyle(fontSize: 24, color: Colors.black),
//                     ),
//                     Text(
//                       "Khelo",
//                       style: TextStyle(fontSize: 15, color: Colors.amber),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 400,
//             left: 60,
//             child: Text(
//               "enter your name",
//               style: TextStyle(
//                 color: const Color.fromARGB(255, 244, 246, 248),
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(height: 200),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 40),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "John Doe...",
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50),
//                   borderSide: BorderSide(
//                     color: const Color.fromARGB(255, 245, 240, 240),
//                     width: 2,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 100),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const CobaQuiz()),
//               );
//             },
//             child: Container(
//               padding: EdgeInsets.all(16),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Color(0xff283FB1),
//                 borderRadius: BorderRadius.circular(6),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Login",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
