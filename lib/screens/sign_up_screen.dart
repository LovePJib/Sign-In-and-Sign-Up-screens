import 'package:flutter/material.dart';
import 'package:todolist_app/components/my_button.dart';
import 'package:todolist_app/components/my_textfield.dart';
import 'package:todolist_app/constant/constant.dart';
import 'package:todolist_app/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final re_passwordController = TextEditingController();
  
  String? errorMessage;

  void signUp() async {
    if (passwordController.text != re_passwordController.text) {
      setState(() {
        errorMessage = "Passwords do not match!";
      });
      return;
    }
    
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(), 
          password: passwordController.text.trim());
      print("Created account!");

      // Show a SnackBar message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sign-up complete!"),
          duration: Duration(seconds: 2),
        ),
      );

      // Navigate to the SignInScreen after a delay
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      });
      
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message; // Display Firebase error messages
      });
      print("Failed to create account: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set to transparent
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 80, 15, 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8), // Slightly opaque white background
              borderRadius: BorderRadius.circular(10), // Optional: round the corners
            ),
            padding: const EdgeInsets.all(20), // Add padding for inner content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to KMUTNB community',
                  style: textTitle,
                ),
                const SizedBox(height: 20),
                Text(
                  'To get started, please create an account,',
                  style: textSubTitle,
                ),
                const SizedBox(height: 30),
                MyTextField(
                    controller: nameController,
                    hintText: 'Enter your name',
                    obscureText: false,
                    labelText: 'Name'),
                const SizedBox(height: 20),
                MyTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    obscureText: false,
                    labelText: 'Email'),
                const SizedBox(height: 20),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                    labelText: 'Password'), // Set obscureText to true
                const SizedBox(height: 20),
                MyTextField(
                    controller: re_passwordController,
                    hintText: 'Enter your password again',
                    obscureText: true,
                    labelText: 'Re-Password'), // Set obscureText to true
                const SizedBox(height: 30),
                if (errorMessage != null)
                  Text(errorMessage!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 10),
                MyButton(onTap: signUp, hintText: 'Register now'),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign-in',
                        style: TextStyle(
                          fontWeight: FontWeight.w500, 
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
