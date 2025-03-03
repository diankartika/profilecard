import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: ProfileCard()),
      ),
    ),
  );
}

class ProfileCard extends StatelessWidget {
  // URL Sosial Media
  final Uri instagramUrl = Uri.parse("https://instagram.com/putridiantika_");
  final Uri githubUrl = Uri.parse("https://github.com/diankartika");
  final Uri whatsappUrl = Uri.parse("https://wa.me/6282237392457");

  void _launchURL(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Glowing Effect
        Container(
          width: 320,
          height: 450,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(
                  255,
                  167,
                  178,
                  173,
                ).withOpacity(0.6),
                blurRadius: 50,
                spreadRadius: 10,
              ),
            ],
          ),
        ),

        // Main Card with Blur Effect
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 320,
              height: 450,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Top Row with Back and Menu Icons
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10,
                    ),
                  ),

                  // Profile Picture with Neon Border
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.greenAccent, width: 3),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  // Name & Role (Center Align)
                  Text(
                    'Dian Kartika Putri',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Text(
                          'Mobile App Developer',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign:
                              TextAlign.center, // Biar keterangan di tengah
                        ),
                        SizedBox(height: 15), // Nambahin jarak dikit antar teks
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 11,
                          ),
                          textAlign:
                              TextAlign.center, // Biar keterangan di tengah
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 22),

                  // Social Icons (Clickable)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _launchURL(instagramUrl),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 22,
                          child: Padding(
                            padding: EdgeInsets.all(
                              8,
                            ), // Beri padding agar gambar tidak mepet
                            child: Image.asset(
                              'assets/instagram.png',
                              fit: BoxFit.contain,
                            ),
                          ), // Icon Instagram
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () => _launchURL(githubUrl),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 22,
                          child: Padding(
                            padding: EdgeInsets.all(
                              8,
                            ), // Beri padding agar gambar tidak mepet
                            child: Image.asset(
                              'assets/github.png',
                              fit: BoxFit.contain,
                            ),
                          ), // Icon GitHub
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Chat Button
                  ElevatedButton(
                    onPressed: () => _launchURL(whatsappUrl),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      backgroundColor: Colors.greenAccent,
                    ),
                    child: Text(
                      'Chat Me!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
