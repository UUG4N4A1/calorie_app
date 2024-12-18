import 'package:calorie_app/components/my_button.dart';
import 'package:calorie_app/components/my_textfield.dart';
import 'package:calorie_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // Controllers for all input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  // Function for handling registration and navigation
  void register(BuildContext context) {
    String email = _emailController.text;
    String name = _nameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;
    String height = _heightController.text;
    String weight = _weightController.text;

    // Add validation logic for password and other fields (optional)
    if (password != confirmPassword) {
      // Show an error message if passwords don't match
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Passwords do not match!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    // Navigate to the HomePage, passing the user data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HomePage(email: email), // Passing email to HomePage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Row(
                  children: [
                    Icon(
                      Icons.local_drink,
                      size: 60,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Calorie Tracker",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                // Form Section
                Text(
                  "Create your account",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 25),

                // Name field
                MyTextfield(
                  hintText: "Name",
                  obscureText: false,
                  controller: _nameController,
                ),
                const SizedBox(height: 25),

                // Email field
                MyTextfield(
                  hintText: "Email",
                  obscureText: false,
                  controller: _emailController,
                ),
                const SizedBox(height: 25),

                // Password field
                MyTextfield(
                  hintText: 'Password',
                  obscureText: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 25),

                // Confirm Password field
                MyTextfield(
                  hintText: 'Confirm Password',
                  obscureText: true,
                  controller: _confirmPasswordController,
                ),
                const SizedBox(height: 25),

                // Height field
                MyTextfield(
                  hintText: 'Your height',
                  obscureText: false,
                  controller: _heightController,
                ),
                const SizedBox(height: 25),

                // Weight field
                MyTextfield(
                  hintText: 'Your weight',
                  obscureText: false,
                  controller: _weightController,
                ),
                const SizedBox(height: 25),

                // Register button
                MyButton(
                  text: "Register",
                  onTap: () => register(context),
                ),
                const SizedBox(height: 25),

                // Log In redirection
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Already have an account?",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 11),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          "Log In",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
