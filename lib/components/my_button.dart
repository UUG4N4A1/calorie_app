import 'package:flutter/material.dart';

//custom button
class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
