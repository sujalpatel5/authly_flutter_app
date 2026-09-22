import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/auth_controller.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  void login(BuildContext context) async {
    try {
      await AuthController().login(
        email.text.trim(),
        password.text.trim(),
      );
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
      backgroundColor: const Color(0xFFEBF1FE),
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
            const SizedBox(height: 20),
            Text(
              'Welcome to Authly',
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF373844),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
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
                onPressed: () => login(context),
                child: Text(
                  'Login',
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
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SignupScreen()),
              ),
              child: Text(
                'Create an account',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2839B7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}