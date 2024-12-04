import 'package:calorie_app/components/my_button.dart';
import 'package:calorie_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart'; 

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
// register
  void register(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

//login
  void login(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(
              height: 40,
            ),
            Text(
              "Eat smarter.\n Live Better",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(
              height: 50,
            ),
            
            Image.asset(
              'lib/assets/screenshot.png',
              width: 300,
              height: 400, 
            ),
            const SizedBox(
              height: 25,
            ),
            //sign up button
            MyButton(
              text: "SIGN UP",
              onTap: () => register(context), 
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Already have an account ?",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 10,
                  ),
            ),
           //login button
            GestureDetector(
              onTap: () => login(context), 
              child: Text(
                "LOG IN",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
