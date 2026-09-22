import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/auth_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  void signup(BuildContext context) async {
    try {
      await AuthController().signup(
        email.text.trim(),
        password.text.trim(),
      );

      if (context.mounted) Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void googleLogin(BuildContext context) async {
    try {
      await AuthController().googleLogin();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Google sign-in failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeaf2ff),
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/authly_logo.png',
              width: 100,
              height: 100,
            ),
            Text(
              'Join Authly',
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF373844),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2839B7),
                  foregroundColor: const Color(0xFFDDE4FF),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => signup(context),
                child: Text(
                  'Create Account',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => googleLogin(context),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: const BorderSide(color: Color(0xFF2839B7)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Continue with Google',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2839B7),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}