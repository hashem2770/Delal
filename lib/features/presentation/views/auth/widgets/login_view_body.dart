import 'package:dalel/core/component/custom_button.dart';
import 'package:dalel/core/component/custom_text_button.dart';
import 'package:dalel/core/error/handle_firebase_error/firebase_exception_handler.dart';
import 'package:dalel/core/error/handle_firebase_error/snackbars.dart';
import 'package:dalel/utils/app_styles.dart';
import 'package:dalel/utils/routing/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: SafeArea(
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
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: buildInputDecoration(
                          hintText: 'Email Address',
                          label: 'Email Address',
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        controller: passwordController,
                        decoration: buildInputDecoration(
                          hintText: 'Password',
                          label: 'Password',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomTextButton(
                              onPressed: () async {
                                await FirebaseAuth.instance
                                    .sendPasswordResetEmail(
                                  email: emailController.text,
                                );
                              },
                              label: 'Forget Password?')
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                          label: 'Log In',
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              // if condition to avoid putting build context inside async gaps
                              if (context.mounted) {
                                FirebaseAuthSnackBars.successfulLoginSnackBar(
                                    context: context);
                                navigateToHomeView();
                              }
                            } on FirebaseAuthException catch (e) {
                              if (context.mounted) {
                                handleFirebaseLoginException(
                                  error: e,
                                  context: context,
                                );
                              }
                            }
                          }),
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
      ),
    );
  }

  //navigate to home view
  void navigateToHomeView() {
    context.pushReplacementNamed(RoutesName.homeView);
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