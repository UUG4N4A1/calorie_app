import 'package:calorie_app/components/my_button.dart';
import 'package:calorie_app/components/my_textfield.dart';
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

  void register() {
    // registeration
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create your account",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // name
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

                  // password
                  MyTextfield(
                    hintText: 'Password',
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 25),

                  // confirm password
                  MyTextfield(
                    hintText: 'Confirm Password',
                    obscureText: true,
                    controller: _confirmPasswordController,
                  ),
                  // height
                  const SizedBox(height: 25),
                  MyTextfield(
                    hintText: 'Your height',
                    obscureText: false,
                    controller: _heightController,
                  ),
                  // weight
                  const SizedBox(height: 25),
                  MyTextfield(
                    hintText: 'Your weight',
                    obscureText: false,
                    controller: _weightController,
                  ),

                  const SizedBox(height: 25),

                  // register button
                  MyButton(
                    text: "Register",
                    onTap: () => register(),
                  ),
                  const SizedBox(height: 25),

                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 11,
                        ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Log In",
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
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
    );
  }
}
