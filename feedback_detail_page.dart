import 'package:flutter/material.dart';
import 'model/feedback_item.dart';
import 'home_page.dart';

class FeedbackDetailPage extends StatelessWidget {
  final FeedbackItem item;
  final int index;

  const FeedbackDetailPage({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Feedback")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama: ${item.name}"),
            Text("NIM: ${item.nim}"),
            Text("Fakultas: ${item.fakultas}"),
            Text("Fasilitas: ${item.fasilitas.join(', ')}"),
            Text("Nilai Kepuasan: ${item.rating}"),
            Text("Jenis Feedback: ${item.jenis}"),
            Text("Setuju: ${item.setuju ? 'Ya' : 'Tidak'}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Kembali"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Konfirmasi Hapus"),
                    content: const Text("Yakin ingin menghapus feedback ini?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Batal"),
                      ),
                      TextButton(
                        onPressed: () {
                          feedbackList.removeAt(index);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("Hapus", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Hapus"),
            ),
          ],
        ),
      ),
    );
  }
}
