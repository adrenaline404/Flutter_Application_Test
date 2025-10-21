import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/profile_header.dart';
import 'widgets/action_buttons.dart';
import 'widgets/footer.dart';
import 'edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Shofwan Zhilaludin';
  String nim = 'C2383207016';
  String prodi = 'Pendidikan Teknologi Informasi';
  String desc =
      'We cant solve problems by using the same kind of thinking we used when we created them. - Albert Einstein';

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
    setState(() {
      name = sp.getString(_kName) ?? name;
      nim = sp.getString(_kNim) ?? nim;
      prodi = sp.getString(_kProdi) ?? prodi;
      desc = sp.getString(_kDesc) ?? desc;
    });
  }

  Future<void> _onEditPressed() async {
    final result = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const EditProfilePage()));
    if (result == true) {
      _loadPrefs();
    }
  }

  void _onDeletePressed() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF23232F),
        title: const Text('Konfirmasi', style: TextStyle(color: Colors.white)),
        content: Row(
          children: const [
            Icon(Icons.warning, color: Colors.red),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Apakah Anda yakin ingin menghapus data profil?',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirm == true) {
      final sp = await SharedPreferences.getInstance();
      await sp.remove(_kName);
      await sp.remove(_kNim);
      await sp.remove(_kProdi);
      await sp.remove(_kDesc);
      setState(() {
        name = 'Shofwan Zhilaludin';
        nim = 'C2383207016';
        prodi = 'Pendidikan Teknologi Informasi';
        desc =
            'We cant solve problems by using the same kind of thinking we used when we created them. - Albert Einstein ';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.colorScheme.onSurface;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileHeader(
                name: name,
                nim: nim,
                prodi: prodi,
                description: desc,
                bannerAsset: 'assets/images/banner.jpg',
                profileAsset: 'assets/images/profile.jpg',
              ),
              const SizedBox(height: 12),
              ActionButtons(onEdit: _onEditPressed, onDelete: _onDeletePressed),
              const SizedBox(height: 16),
              Card(
                color: theme.colorScheme.surface,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(desc, style: TextStyle(color: textColor)),
                ),
              ),
              const SizedBox(height: 24),
              // Sosial Media Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialMediaIcon(
                    icon: FontAwesomeIcons.instagram,
                    color: const Color(0xFFE1306C),
                    label: 'shfwn_31',
                    textColor: textColor,
                  ),
                  const SizedBox(width: 24),
                  _SocialMediaIcon(
                    icon: FontAwesomeIcons.telegram,
                    color: const Color(0xFF0088cc),
                    label: 'adrenaline_404',
                    textColor: textColor,
                  ),
                  const SizedBox(width: 24),
                  _SocialMediaIcon(
                    icon: FontAwesomeIcons.github,
                    color: isDark ? Colors.white : Colors.black,
                    label: 'adrenaline404',
                    textColor: textColor,
                  ),
                ],
              ),
              // Tambahkan Footer di bawah icon sosial media
              const Footer(author: 'Shofwan Zhilaludin'),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget helper untuk icon sosial media
class _SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final Color textColor;
  const _SocialMediaIcon({
    Key? key,
    required this.icon,
    required this.color,
    required this.label,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color.withOpacity(0.15),
          child: FaIcon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 13, color: textColor)),
      ],
    );
  }
}
