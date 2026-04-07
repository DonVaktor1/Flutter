import 'package:flutter/material.dart';
import 'package:flutter_application/screens/login_screen.dart';
import 'package:flutter_application/screens/home_screen.dart';
import 'package:flutter_application/services/auth_service.dart'; // Імпортуємо наш сервіс

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Icon(Icons.app_registration, size: 80, color: Colors.white),
                const Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white, 
                    letterSpacing: 2
                  ),
                ),
                const SizedBox(height: 30),
                
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
                        child: Text(
                          "Join GaonExpress", 
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      _label("Username"),
                      TextField(
                        controller: _usernameController,
                        decoration: _inputDecoration("Choose a username", Icons.person_outline),
                      ),
                      
                      const SizedBox(height: 15),
                      
                      _label("Email"),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: _inputDecoration("Enter your email", Icons.email_outlined),
                      ),
                      
                      const SizedBox(height: 15),
                      
                      _label("Password"),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: _inputDecoration("Create password", Icons.lock_outline),
                      ),
                      
                      const SizedBox(height: 15),
                      
                      _label("Confirm Password"),
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: _inputDecoration("Repeat password", Icons.lock_reset),
                      ),
                      
                      const SizedBox(height: 25),
                      
                      // КНОПКА РЕЄСТРАЦІЇ
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () async {
                            final email = _emailController.text.trim();
                            final password = _passwordController.text.trim();
                            final confirmPassword = _confirmPasswordController.text.trim();
                            if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                              _showError("Please fill in all fields");
                              return;
                            }
                            if (password != confirmPassword) {
                              _showError("Passwords do not match");
                              return;
                            }
                            String? result = await AuthService().signUp(email, password);
                            if (result == null) {
                              if (mounted) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                                );
                              }
                            } else {
                              _showError(result);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE954B9),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text(
                            "Sign Up", 
                            style: TextStyle(fontSize: 18, color: Colors.white)
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 15),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? ", style: TextStyle(fontSize: 13, color: Colors.black54)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 13, color: Color(0xFFE954B9), fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
}