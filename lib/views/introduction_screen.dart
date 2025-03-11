import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:thirdd/utils/constant/app_image.dart';
import 'package:thirdd/views/auth/login_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          titleWidget: Text(
            "🎀 Selamat Datang di Quiz Perempuan! 🎀",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 212, 63, 113),
            ),
          ),
          bodyWidget: Column(
            children: [
              Text(
                "Belajar adalah perjalanan tanpa batas, dan setiap perempuan berhak untuk berkembang. Dengan ilmu, kita bisa membuka peluang, menginspirasi, dan membawa perubahan. Mari mulai langkah kecil hari ini untuk masa depan yang lebih cerah! ✨",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(221, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 220),
            ],
          ),
          image: Image.asset(AppImage.hijab, height: 175.0),
          footer: Padding(
            padding: const EdgeInsets.only(
              top: 150.0,
            ), // Jarak tombol dari body
            child: ElevatedButton(
              onPressed: () {
                introKey.currentState?.next();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 246, 157, 187),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Let's Go!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        PageViewModel(
          titleWidget: Text(
            "🎀SUDAH SIAP??🎀",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 212, 63, 113),
            ),
          ),
          bodyWidget: Column(
            children: [
              Text(
                "Di dunia yang terus berkembang, perempuan punya peran besar dalam membawa perubahan. Kuis ini akan menguji seberapa besar semangat dan wawasanmu tentang kekuatan perempuan! 🚀Siap membuktikan bahwa kamu adalah perempuan hebat? Yuk, mulai sekarang! 💖",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(221, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 220),
            ],
          ),
          image: Image.asset(AppImage.tshirt, height: 175.0),
          footer: Padding(
            padding: const EdgeInsets.only(
              top: 150.0,
            ), // Jarak tombol dari body
            child: ElevatedButton(
              onPressed: () {
                introKey.currentState?.next();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 246, 157, 187),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Let's Go!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
      showNextButton: false,
      showDoneButton: true,
      done: const Text(
        "Done",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      onDone: () {
        
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    );
  }
}
