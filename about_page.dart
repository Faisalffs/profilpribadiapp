import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tentang Aplikasi")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/uin_logo.png', height: 100),
            const SizedBox(height: 20),
            const Text("Pemrograman Mobile - UIN STS Jambi"),
            const Text("Dosen: Ahmad Nasukha, S.Hum., M.S.I"),
            const Text("Pengembang: Ahmad Faisal Assaudi"),
            const Text("Tahun Akademik 2025"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Kembali ke Beranda"),
            ),
          ],
        ),
      ),
    );
  }
}
