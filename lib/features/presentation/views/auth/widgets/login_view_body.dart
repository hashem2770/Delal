import 'package:dalel/core/component/custom_button.dart';
import 'package:dalel/core/component/custom_text_button.dart';
import 'package:dalel/utils/app_styles.dart';
import 'package:dalel/utils/routing/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login_bg_png.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Dalel',
                  style: AppStyles.styleMedium18
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      'Welcome Back !',
                      style: AppStyles.styleMedium24,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    TextField(
                      decoration: buildInputDecoration(
                        hintText: 'Email Address',
                        label: 'Email Address',
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextField(
                      decoration: buildInputDecoration(
                        hintText: 'Password',
                        label: 'Password',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                            onPressed: () {}, label: 'Forget Password?')
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    CustomButton(
                      label: 'Sign In',
                      onPressed: () {
                        //todo: login to firebase
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        CustomTextButton(
                          onPressed: () {
                            context.pushNamed(RoutesName.signUpView);
                          },
                          label: 'Sign Up',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String hintText,
    required String label,
  }) {
    return InputDecoration(
      hintText: hintText,
      label: Text(label),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }
}