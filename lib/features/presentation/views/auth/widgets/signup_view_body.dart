import 'package:dalel/core/component/custom_button.dart';
import 'package:dalel/core/component/custom_text_button.dart';
import 'package:dalel/utils/app_styles.dart';
import 'package:dalel/utils/routing/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();
  bool agreedToTerms = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            alignment: Alignment.center,
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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'First Name is required';
                    }
                    return null;
                  },
                  controller: firstNameController,
                  decoration: buildInputDecoration(
                    hintText: 'First Name',
                    label: 'First Name',
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Last Name is required';
                    }
                    return null;
                  },
                  controller: lastNameController,
                  decoration: buildInputDecoration(
                    hintText: 'Last Name',
                    label: 'Last Name',
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: buildInputDecoration(
                    hintText: 'Email Address',
                    label: 'Email Address',
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  controller: passwordController,
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
                      value: agreedToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreedToTerms = value!;
                        });
                      },
                    ),
                    const Text(
                      'I agree to the Terms & Conditions',
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                CustomButton(
                  onPressed: () async {
                    try {
                      if(agreedToTerms){
                        if (_formKey.currentState!.validate() ) {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          successfulSignUp();
                          navigateToHomeView();
                        }
                      } else {
                        generalErrorSnackBar(
                          'Could not sign up without agreeing to the terms and conditions',
                        );
                      }

                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        weakPasswordSnackBar();
                      } else if (e.code == 'email-already-in-use') {
                        emailAlreadyInUseSnackBar();
                      }
                    } catch (e) {
                      generalErrorSnackBar(e.toString());
                    }
                    //context.pushReplacementNamed(RoutesName.homeView);
                  },
                  label: 'Sign Up',
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    CustomTextButton(
                      onPressed: () {
                        context.pushReplacement('/login');
                      },
                      label: 'Sign In',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //navigate to home view
  void navigateToHomeView() {
    context.pushReplacementNamed(RoutesName.homeView);
  }

  // snack bar about successful login
  void successfulSignUp() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sign up Successful'),
      ),
    );
  }

  // snack bar about weak password
  void weakPasswordSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('The password provided is too weak.'),
    ));
  }

  // snack bar about Email Already In Use
  void emailAlreadyInUseSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('The account already exists for that email'),
    ));
  }

  // snack bar about General Error
  void generalErrorSnackBar(String e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(e),
    ));
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
