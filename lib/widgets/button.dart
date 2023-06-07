import 'package:flutter/material.dart';
import 'package:grocery_cubit/style/app_colors.dart';
import 'package:grocery_cubit/style/app_typography.dart';
import 'package:grocery_cubit/style/dimens.dart';

class Button extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const Button({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.xl),
          child: ElevatedButton(
            onPressed: () => onPressed(),
            style: ElevatedButton.styleFrom(
                backgroundColor: green,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(Dimens.m)),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.xxl, vertical: Dimens.xl),
              child: Text(
                title,
                style: AppTypography.style2,
              ),
            ),
          ),
        ),
      );
}
