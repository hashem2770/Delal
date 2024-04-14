import 'package:dalel/core/component/custom_button.dart';
import 'package:dalel/core/component/custom_text_button.dart';
import 'package:dalel/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          alignment:  Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 80),
              Text(
                'Welcome!',
                textAlign: TextAlign.center,
                style: AppStyles.styleMedium24
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: buildInputDecoration(
                  hintText: 'First Name',
                  label: 'First Name',
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                decoration: buildInputDecoration(
                  hintText: 'Last Name',
                  label: 'Last Name',
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                decoration: buildInputDecoration(
                  hintText: 'Email Address',
                  label: 'Email Address',
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                decoration: buildInputDecoration(
                  hintText: 'Password',
                  label: 'Password',
                ),
              ),
              //const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  const Text(
                    'I agree to the Terms & Conditions',
                  ),
                ],
              ),
              const SizedBox(height: 80),
              CustomButton(onPressed: () {}, label: 'Sign Up'),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  CustomTextButton(onPressed: () {}, label: 'Sign In'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(
      {required String hintText, required String label}) {
    return InputDecoration(
      hintText: hintText,
      label: Text(label),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }
}
