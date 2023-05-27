import 'package:ShopCart/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // logo
          Padding(
            padding:
                const EdgeInsets.only(left: 80, right: 80, bottom: 40, top: 50),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('lib/images/lidl.png')),
          ),
          // we deliver groceries at your doorstep
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Lidl lohnt sich nicht, vertrau mir.',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // fresh items everyday
          Text(
            'Frisch aus dem abgefuckten Duisburg',
            style: TextStyle(
              color: Colors.grey[600],
              decoration: TextDecoration.underline,
              decorationColor: Colors.amber,
              decorationThickness: 2,
              fontSize: 16,
            ),
          ),
          // get started buton

          const Spacer(),

          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 25, 66, 201),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Fette Angebote",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
