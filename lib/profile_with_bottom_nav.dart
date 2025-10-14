import 'package:flutter/material.dart';
import 'profile_page.dart';

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
    const Center(child: Text('Settings Page, Coming Soon! :)')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF232526), Color(0xFF414345)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        actions: widget.themeSwitcher != null
            ? [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: widget.themeSwitcher!,
                ),
              ]
            : null,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.tealAccent,
        backgroundColor: const Color(0xFF232526),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
