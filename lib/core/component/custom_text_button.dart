import 'package:dalel/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key,required this.onPressed, required this.label,});
  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: AppStyles.styleRegular16,
      ),
    );
  }
}
