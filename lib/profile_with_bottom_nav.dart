import 'package:flutter/material.dart';
import 'profile_page.dart';

// Custom Pages
class CustomListViewPage extends StatelessWidget {
  const CustomListViewPage({super.key});

  void _showDetail(BuildContext context, int i) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF23232F),
        title: Text(
          'Detail Mahasiswa',
          style: const TextStyle(color: Colors.white),
        ),
        content: Text(
          'Nama: Shofwan Zhilaludin\nNIM: C238320701${i + 1}\nProdi: Pendidikan Teknologi Informasi',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Tutup', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('ListView'), centerTitle: true),
      backgroundColor: Colors.black,
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () => _showDetail(context, i),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.white.withOpacity(0.18),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                child: Text(
                  '${i + 1}',
                  style: TextStyle(color: theme.colorScheme.primary),
                ),
              ),
              title: Text(
                'Shofwan Zhilaludin',
                style: TextStyle(color: theme.colorScheme.onSurface),
              ),
              subtitle: Text(
                'C238320701${i + 1}',
                style: TextStyle(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              trailing: const Icon(Icons.info_outline),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomGridViewPage extends StatelessWidget {
  const CustomGridViewPage({super.key});

  void _showSnackBar(BuildContext context, int i) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Grid ${i + 1} ditekan!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('GridView'), centerTitle: true),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: 8,
          itemBuilder: (ctx, i) => GestureDetector(
            onTap: () => _showSnackBar(context, i),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withOpacity(0.18),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Grid ${i + 1}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCardPage extends StatelessWidget {
  const CustomCardPage({super.key});

  void _showDetail(BuildContext context, int i) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF23232F),
        title: Text('Detail Card', style: const TextStyle(color: Colors.white)),
        content: Text(
          '${i + 1} - Shofwan Zhilaludin\nNIM: C2383207016\nPendidikan Teknologi Informasi',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Tutup', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Card'), centerTitle: true),
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () => _showDetail(context, i),
          child: Card(
            color: Colors.black,
            elevation: 6,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.white.withOpacity(0.18), width: 2),
            ),
            shadowColor: Colors.white.withOpacity(0.10),
            child: ListTile(
              leading: Icon(
                Icons.credit_card,
                color: theme.colorScheme.primary,
              ),
              title: Text(
                'Shofwan Zhilaludin',
                style: TextStyle(color: theme.colorScheme.onSurface),
              ),
              subtitle: Text(
                'Mahasiswa',
                style: TextStyle(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              trailing: const Icon(Icons.info_outline),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileWithBottomNav extends StatefulWidget {
  final Widget? themeSwitcher;
  const ProfileWithBottomNav({super.key, this.themeSwitcher});

  @override
  State<ProfileWithBottomNav> createState() => _ProfileWithBottomNavState();
}

class _ProfileWithBottomNavState extends State<ProfileWithBottomNav> {
  int _selectedIndex = 1; // default ke profile

  static final List<Widget> _pages = <Widget>[
    const Center(
      child: Text(
        'Hi? Im just learning, let me know if Im wrong sometimes. :)',
      ),
    ),

    const ProfilePage(),
    const CustomListViewPage(),
    const CustomGridViewPage(),
    const CustomCardPage(),
    const Center(child: Text('Settings Page (Coming Soon!)')),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: theme.colorScheme.surface,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: Colors.white54,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ListView'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: 'GridView'),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Card'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
