import 'package:calorie_app/components/my_button.dart';
import 'package:calorie_app/components/my_textfield.dart';
import 'package:calorie_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void register(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  void login() {
    // login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(20.0), 
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
              CrossAxisAlignment.start, 
          children: [
            
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, 
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
              margin: EdgeInsets.only(bottom: 250),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Eat smarter.\n Live Better.",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                      height: 25), 

                  // Email Textfield
                  MyTextfield(
                    hintText: "Email",
                    obscureText: false,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 25),

                  // Password Textfield
                  MyTextfield(
                    hintText: 'Password',
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(
                      height: 25), 

                  // Log-In Button
                  MyButton(
                    text: "Log In",
                    onTap: () => login(),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Don't have an account ?",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 11,
                        ),
                  ),
                  GestureDetector(
                    onTap: () => register(context), 
                    child: Text(
                      "SIGN UP",
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
