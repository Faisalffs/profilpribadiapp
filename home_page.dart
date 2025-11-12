import 'package:flutter/material.dart';
import 'feedback_form_page.dart';
import 'feedback_list_page.dart';
import 'about_page.dart';
import 'model/feedback_item.dart';

List<FeedbackItem> feedbackList = [];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Campus Feedback")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/flutter_logo.png', height: 120),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const FeedbackFormPage()));
              },
              child: const Text("Isi Form Feedback"),
            ),
            ElevatedButton(
              onPressed: feedbackList.isNotEmpty
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FeedbackListPage()),
                );
              }
                  : null,
              child: const Text("Lihat Daftar Feedback"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutPage()),
                );
              },
              child: const Text("Tentang Aplikasi"),
            ),
            const Spacer(),
            const Text(
              "“Coding adalah seni memecahkan masalah dengan logika dan kreativitas.”",
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
