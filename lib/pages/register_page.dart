import 'package:calorie_app/components/my_button.dart';
import 'package:calorie_app/components/my_textfield.dart';
import 'package:calorie_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void register(BuildContext context) {
    String email = _emailController.text;
    String name = _nameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;
    String height = _heightController.text;
    String weight = _weightController.text;

    if (password != confirmPassword) {
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

    // homepage ruu shiljih, hergelegchiin medeelel ywuulah
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HomePage(email: email),
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
                Text(
                  "Create your account",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 25),

                // ner
                MyTextfield(
                  hintText: "Name",
                  obscureText: false,
                  controller: _nameController,
                ),
                const SizedBox(height: 25),

                // email
                MyTextfield(
                  hintText: "Email",
                  obscureText: false,
                  controller: _emailController,
                ),
                const SizedBox(height: 25),

                // passowrd
                MyTextfield(
                  hintText: 'Password',
                  obscureText: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 25),

                // dahin shalgah
                MyTextfield(
                  hintText: 'Confirm Password',
                  obscureText: true,
                  controller: _confirmPasswordController,
                ),
                const SizedBox(height: 25),

                // ondor
                MyTextfield(
                  hintText: 'Your height',
                  obscureText: false,
                  controller: _heightController,
                ),
                const SizedBox(height: 25),

                // jin
                MyTextfield(
                  hintText: 'Your weight',
                  obscureText: false,
                  controller: _weightController,
                ),
                const SizedBox(height: 25),

                // burtgel
                MyButton(
                  text: "Register",
                  onTap: () => register(context),
                ),
                const SizedBox(height: 25),

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
