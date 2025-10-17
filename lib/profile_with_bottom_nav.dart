import 'package:flutter/material.dart';
import 'profile_page.dart';

// --- Custom Pages ---
class CustomListViewPage extends StatelessWidget {
  const CustomListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Test'), centerTitle: true),
      backgroundColor: theme.colorScheme.background,
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (ctx, i) => Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
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
              'Item ${i + 1}',
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
            subtitle: Text(
              'Shofwan Zhilaludin',
              style: TextStyle(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomGridViewPage extends StatelessWidget {
  const CustomGridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('GridView Test'), centerTitle: true),
      backgroundColor: theme.colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: 8,
          itemBuilder: (ctx, i) => Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
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
    );
  }
}

class CustomCardPage extends StatelessWidget {
  const CustomCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Card Test'), centerTitle: true),
      backgroundColor: theme.colorScheme.background,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (ctx, i) => Card(
          color: theme.colorScheme.surface,
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Icon(Icons.credit_card, color: theme.colorScheme.primary),
            title: Text(
              'Card ${i + 1}',
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
            subtitle: Text(
              'Shofwan Zhilaludin',
              style: TextStyle(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileWithBottomNav extends StatefulWidget {
  final Widget? themeSwitcher;
  const ProfileWithBottomNav({Key? key, this.themeSwitcher}) : super(key: key);

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
    const Center(child: Text('Settings Page, Coming Soon! :)')),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
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
