import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const blue = Color(0xFF2839B7);
  static const bg = Color(0xFFECF1FD);
  static const card = Color(0xFFF7F9FF);

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = AuthController().user;
    final name = user?.displayName ?? 'User';
    final email = user?.email ?? '';
    final initial = name[0].toUpperCase();

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 65,
              color: const Color(0xFFC3CFF3),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/authly_logo.png',
                    width: 38,
                    height: 38,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Authly',
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: blue,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => AuthController().logout(),
                    icon: const Icon(Icons.logout, color: blue),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your identity, secured!',
                      style: GoogleFonts.inter(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Welcome back!',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: const Color(0xFF42629A),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Card(
                      color: card,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xFFE7D9FF),
                          child: Text(
                            initial,
                            style: GoogleFonts.inter(color: blue),
                          ),
                        ),
                        title: Text(
                          name,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(email),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Quick Actions',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      children: [
                        action(Icons.person_outline, 'Profile'),
                        action(Icons.security, 'Security'),
                      ],
                    ),

                    Row(
                      children: [
                        action(Icons.settings_outlined, 'Settings'),
                        action(Icons.help_outline, 'Help'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: card,
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        selectedItemColor: blue,
        unselectedItemColor: const Color(0xFF85A4DD),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget action(IconData icon, String text) {
    return Expanded(
      child: Card(
        color: card,
        child: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: blue, size: 30),
              const SizedBox(height: 5),
              Text(
                text,
                style: GoogleFonts.inter(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}