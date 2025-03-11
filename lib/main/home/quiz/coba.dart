import 'package:flutter/material.dart';
import 'package:thirdd/main/home/quiz/detail_quiz.dart';

class CobaQuiz extends StatefulWidget {
  const CobaQuiz({super.key});

  @override
  State<CobaQuiz> createState() => _CobaQuizState();
}

class _CobaQuizState extends State<CobaQuiz> {
  int? _selectedYear = -1;
  final List<int> years = [2000, 2023, 2024, 2025];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailQuiz(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios, size: 12),
                          Text(
                            "Previous",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "7/10",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
              SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(top: 75),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 229,
                    child: Center(
                      child: Text(
                        "Tahun berapa saat ini?",
                        style: TextStyle(
                          fontFamily: "Baloo 2",
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 85,
                              height: 85,
                              child: CircularProgressIndicator(
                                value: 0.5,
                                strokeWidth: 8,
                                backgroundColor: Color(0xffABD1C6),
                                valueColor: AlwaysStoppedAnimation(
                                  Color(0xff004643),
                                ),
                              ),
                            ),
                            Text(
                              "30",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff004643),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children:
                      years.map((year) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 4.0,
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(
                                color:
                                    _selectedYear == year
                                        ? Colors.blue
                                        : Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                            color:
                                _selectedYear == year
                                    ? Colors.blue.shade100
                                    : Colors.white,
                            child: RadioListTile<int>(
                              title: Text(
                                year.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              value: year,
                              groupValue: _selectedYear,
                              onChanged: (int? value) {
                                setState(() {
                                  _selectedYear = value;
                                });
                              },
                              activeColor: Colors.teal.shade900,
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
              SizedBox(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 10,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Color(0xff004643),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



 // Container(
          //   padding: EdgeInsets.all(16),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(20),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black,
          //         spreadRadius: 5,
          //         blurRadius: 5,
          //         offset: Offset(0, 3),
          //       ),
          //     ],
          //   ),
          // ),