import 'package:flutter/material.dart';

import '../pages/style/app_typography.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.title, required this.onPressed});

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF40C77C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Text(
                title,
                style: AppTypography.style2,
              ),
            ),
          ),
        ),
      );
}

//Strings.of(context).buy
