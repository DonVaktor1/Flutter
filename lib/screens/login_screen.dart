import 'package:flutter/material.dart';
import 'package:flutter_application/screens/home_screen.dart';
import 'package:flutter_application/screens/register_screen.dart';
import 'package:flutter_application/services/auth_service.dart'; // Додаємо сервіс

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF9D42), Color(0xFFFF8000)],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Icon(Icons.inventory_2_outlined, size: 100, color: Colors.white),
            const Text(
              'GAON EXPRESS',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
            ),
            const Text(
              'Connecting Villages, Delivery Smiles',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text("WELCOME BACK!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  
                  const Text("Email", style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: _inputDecoration("Enter email", Icons.person_outline),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  const Text("Password", style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: _inputDecoration("Enter password", Icons.lock_outline),
                  ),
                  
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () async {
                        final email = _emailController.text.trim();
                        final password = _passwordController.text.trim();

                        if (email.isEmpty || password.isEmpty) {
                          _showMessage("Please enter email and password");
                          return;
                        }
                        String? result = await AuthService().signIn(email, password);
                        if (result == null) {
                          if (mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()),
                            );
                          }
                        } else {
                          _showMessage(result);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE954B9),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text("Continue", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ", style: TextStyle(fontSize: 16, color: Colors.black54)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterScreen()),
                          );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 16, color: Color(0xFFE954B9), fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _statItem("500+", "pick-up\nPoints"),
                  _statItem("24hrs", "fast\ndelivery"),
                  _statItem("1000+", "villages"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.redAccent),
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 15),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xFFE954B9), width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xFFE954B9), width: 2),
      ),
    );
  }

  Widget _statItem(String val, String text) {
    return Column(
      children: [
        Text(val, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        Text(text, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}