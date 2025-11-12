import 'package:flutter/material.dart';
import 'feedback_detail_page.dart';
import 'home_page.dart';

class FeedbackListPage extends StatelessWidget {
  const FeedbackListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Feedback")),
      body: ListView.builder(
        itemCount: feedbackList.length,
        itemBuilder: (context, index) {
          final item = feedbackList[index];
          IconData icon = Icons.comment;
          Color color = Colors.grey;

          if (item.jenis == "Apresiasi") {
            icon = Icons.thumb_up;
            color = Colors.green;
          } else if (item.jenis == "Saran") {
            icon = Icons.lightbulb;
            color = Colors.blue;
          } else if (item.jenis == "Keluhan") {
            icon = Icons.warning;
            color = Colors.red;
          }

          return Card(
            child: ListTile(
              leading: Icon(icon, color: color),
              title: Text(item.name),
              subtitle: Text("Fakultas: ${item.fakultas} | Rating: ${item.rating.toStringAsFixed(1)}"),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => FeedbackDetailPage(item: item, index: index)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
