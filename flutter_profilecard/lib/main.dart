import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return Center(
              child: SizedBox(width: 450, height: 650, child: ProfileCard()),
            );
          },
        ),
      ),
    ),
  );
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white.withOpacity(0.15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Icon(Icons.arrow_back_ios), Icon(Icons.more_vert)],
            ),
            const Text('Hello'),
          ],
        ),
      ),
    );
  }
}
