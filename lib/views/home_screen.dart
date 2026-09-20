import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthController().user;

    return Scaffold(
      backgroundColor: const Color(0xffeaf2ff),

      appBar: AppBar(
        title: const Text('Authly'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => AuthController().logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${user?.name ?? 'User'} 👋',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'Welcome back!',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(user?.initial ?? 'U'),
                ),
                title: Text(user?.name ?? 'User'),
                subtitle: Text(user?.email ?? ''),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              children: [
                action(Icons.person, 'Profile'),
                action(Icons.security, 'Security'),
              ],
            ),

            Row(
              children: [
                action(Icons.settings, 'Settings'),
                action(Icons.help, 'Help'),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: 0,
        items: [
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

  Widget action(IconData icon, String name) {
    return Expanded(
      child: Card(
        child: SizedBox(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.deepPurple),
              Text(name),
            ],
          ),
        ),
      ),
    );
  }
}