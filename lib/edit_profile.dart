import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _nimC = TextEditingController();
  final TextEditingController _prodiC = TextEditingController();
  final TextEditingController _descC = TextEditingController();

  static const _kName = 'profile_name';
  static const _kNim = 'profile_nim';
  static const _kProdi = 'profile_prodi';
  static const _kDesc = 'profile_desc';

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final sp = await SharedPreferences.getInstance();
    _nameC.text = sp.getString(_kName) ?? 'Shofwan Zhilaludin';
    _nimC.text = sp.getString(_kNim) ?? 'C2383207016';
    _prodiC.text = sp.getString(_kProdi) ?? 'Pendidikan Teknologi Informasi';
    _descC.text =
        sp.getString(_kDesc) ??
        'We cant solve problems by using the same kind of thinking we used when we created them. - Albert Einstein';
    setState(() {});
  }

  Future<void> _savePrefs() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kName, _nameC.text.trim());
    await sp.setString(_kNim, _nimC.text.trim());
    await sp.setString(_kProdi, _prodiC.text.trim());
    await sp.setString(_kDesc, _descC.text.trim());
    // Kembalikan data ke previous screen
    if (mounted) {
      Navigator.of(context).pop(true); // true
    }
  }

  @override
  void dispose() {
    _nameC.dispose();
    _nimC.dispose();
    _prodiC.dispose();
    _descC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.primary,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameC,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Nama wajib diisi!'
                      : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nimC,
                  decoration: InputDecoration(
                    labelText: 'NIM',
                    prefixIcon: const Icon(Icons.badge),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _prodiC,
                  decoration: InputDecoration(
                    labelText: 'Prodi',
                    prefixIcon: const Icon(Icons.school),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _descC,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi',
                    prefixIcon: const Icon(Icons.description),
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _savePrefs,
                    style: ElevatedButton.styleFrom(
                      // Testing color scheme from profile_page.dart
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Simpan'),
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
