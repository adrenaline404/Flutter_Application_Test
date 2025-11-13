import 'package:flutter/material.dart';
import '../models/user_data.dart';
import 'result_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  void _confirmBack() {
    if (_nameController.text.isEmpty &&
        _emailController.text.isEmpty &&
        _ageController.text.isEmpty) {
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text(
            'Data form yang sudah diinput akan hilang. Yakin ingin kembali?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx); // Tutup dialog
                Navigator.pop(context); // Kembali ke home
              },
              child: const Text('Ya, Kembali'),
            ),
          ],
        ),
      );
    }
  }

  // VALIDASI: Nama - tidak kosong & min 3 karakter
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    if (value.length < 3) {
      return 'Nama minimal 3 karakter';
    }
    return null;
  }

  // VALIDASI: Email - tidak kosong & format email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  // VALIDASI: Umur - tidak kosong & angka 1-120
  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Umur tidak boleh kosong';
    }
    final age = int.tryParse(value);
    if (age == null) {
      return 'Umur harus berupa angka';
    }
    if (age < 1 || age > 120) {
      return 'Umur harus antara 1 - 120';
    }
    return null;
  }

  // STATE MANAGEMENT: Submit form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Object UserData
      final userData = UserData(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        age: int.parse(_ageController.text.trim()),
      );

      // SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Data berhasil disimpan!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Navigasi ke ResultPage dengan data
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultPage(userData: userData)),
      );
    }
  }

  // Reset form
  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _ageController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Form berhasil direset'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Handle Android back button
      onWillPop: () async {
        _confirmBack();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Input Data'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _confirmBack,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: _resetForm,
              tooltip: 'Reset Form',
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // FIELD 1: Nama
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    hintText: 'Masukkan nama lengkap',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person),
                  ),
                  validator: _validateName,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 16),

                // FIELD 2: Email
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'contoh@email.com',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 16),

                // FIELD 3: Umur
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    labelText: 'Umur',
                    hintText: 'Masukkan umur',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.cake),
                  ),
                  keyboardType: TextInputType.number,
                  validator: _validateAge,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 24),

                // STATE MANAGEMENT: Preview data real-time
                if (_nameController.text.isNotEmpty ||
                    _emailController.text.isNotEmpty ||
                    _ageController.text.isNotEmpty) ...[
                  Card(
                    color: const Color.fromARGB(255, 25, 45, 60),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Preview Data (Real-time):',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('Nama: ${_nameController.text}'),
                          Text('Email: ${_emailController.text}'),
                          Text('Umur: ${_ageController.text}'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _resetForm,
                        child: const Text('Reset'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text('Kirim'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _confirmBack,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali ke Home'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
