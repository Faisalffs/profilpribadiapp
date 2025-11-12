import 'package:flutter/material.dart';
import 'model/feedback_item.dart';
import 'feedback_list_page.dart';
import 'home_page.dart';

class FeedbackFormPage extends StatefulWidget {
  const FeedbackFormPage({super.key});

  @override
  State<FeedbackFormPage> createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nimController = TextEditingController();
  String? fakultas;
  List<String> fasilitas = [];
  double rating = 3;
  String jenis = 'Saran';
  bool setuju = false;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (!setuju) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Konfirmasi"),
          content: const Text("Harus setuju dengan syarat & ketentuan."),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
          ],
        ),
      );
      return;
    }

    final item = FeedbackItem(
      name: _nameController.text,
      nim: _nimController.text,
      fakultas: fakultas!,
      fasilitas: fasilitas,
      rating: rating,
      jenis: jenis,
      setuju: setuju,
    );

    feedbackList.add(item);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FeedbackListPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Feedback")),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Nama Mahasiswa"),
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(labelText: "NIM"),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Fakultas"),
                value: fakultas,
                items: ["Sains & Teknologi", "Syariah", "Ekonomi", "Adab"].map((f) {
                  return DropdownMenuItem(value: f, child: Text(f));
                }).toList(),
                onChanged: (val) => setState(() => fakultas = val),
                validator: (v) => v == null ? "Pilih fakultas" : null,
              ),
              const SizedBox(height: 10),
              const Text("Fasilitas yang Dinilai:"),
              CheckboxListTile(
                title: const Text("Perpustakaan"),
                value: fasilitas.contains("Perpustakaan"),
                onChanged: (val) => setState(() {
                  val! ? fasilitas.add("Perpustakaan") : fasilitas.remove("Perpustakaan");
                }),
              ),
              CheckboxListTile(
                title: const Text("Kantin"),
                value: fasilitas.contains("Kantin"),
                onChanged: (val) => setState(() {
                  val! ? fasilitas.add("Kantin") : fasilitas.remove("Kantin");
                }),
              ),
              const Text("Nilai Kepuasan:"),
              Slider(
                value: rating,
                onChanged: (val) => setState(() => rating = val),
                divisions: 4,
                label: rating.toStringAsFixed(1),
                min: 1,
                max: 5,
              ),
              const Text("Jenis Feedback:"),
              RadioListTile(
                title: const Text("Saran"),
                value: "Saran",
                groupValue: jenis,
                onChanged: (v) => setState(() => jenis = v!),
              ),
              RadioListTile(
                title: const Text("Keluhan"),
                value: "Keluhan",
                groupValue: jenis,
                onChanged: (v) => setState(() => jenis = v!),
              ),
              RadioListTile(
                title: const Text("Apresiasi"),
                value: "Apresiasi",
                groupValue: jenis,
                onChanged: (v) => setState(() => jenis = v!),
              ),
              SwitchListTile(
                title: const Text("Setuju dengan Syarat & Ketentuan"),
                value: setuju,
                onChanged: (val) => setState(() => setuju = val),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Simpan Feedback"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
