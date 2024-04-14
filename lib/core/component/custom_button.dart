import 'package:dalel/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffC49E85),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: AppStyles.styleMedium18.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
