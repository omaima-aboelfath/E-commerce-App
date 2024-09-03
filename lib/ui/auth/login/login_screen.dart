import 'package:ecommerce_app/ui/auth/login/cubit/login_cubit.dart';
import 'package:ecommerce_app/ui/auth/login/cubit/login_states.dart';
import 'package:ecommerce_app/ui/utils/custom_text_form_field.dart';
import 'package:ecommerce_app/ui/auth/register/signup_screen.dart';
import 'package:ecommerce_app/ui/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  // const SignInScreen({super.key});
  static const String routeName = 'log_in';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // bool isObscure = true;
  // var formKey = GlobalKey<FormState>();
  LoginCubit cubit = LoginCubit();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, loadingLabel: 'Loading...');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context, message: state.errorMessage, title: 'Error',posActionName: 'Ok');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context, message: 'Login Successfully', title: 'Success',posActionName: 'Ok');
        }
      },
      bloc: cubit,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
              ),
              Container(
                padding: EdgeInsets.all(7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome back to Route',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text(
                      'Please sign in with your mail',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFieldItem(
                          hintText: 'enter your email',
                          controller: cubit.emailController,
                          text: 'Email',
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter email'; // invalid
                            }
                            final bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(cubit.emailController.text);
                            // if email not valid
                            if (!emailValid) {
                              return 'Please enter valid email';
                            }
                            return null; // valid
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFieldItem(
                          hintText: 'enter your password',
                          controller: cubit.passwordController,
                          text: 'Password',
                          obscureText: cubit.isObscure,
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (cubit.isObscure) {
                                  cubit.isObscure = false;
                                } else {
                                  cubit.isObscure = true;
                                }
                                setState(() {});
                              },
                              icon: cubit.isObscure
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter password'; // invalid
                            }
                            if (text.length < 6) {
                              return 'Password must be at least 6 digits';
                            }
                            return null; // valid
                          },
                          keyboardType: TextInputType.number,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.white)),
                            onPressed: () {
                              cubit.login();
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xFF003866),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, SignUpScreen.routeName);
                              },
                              child: Text(
                                "Create Account",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void login() {
  //   if (formKey.currentState?.validate() == true) {}
  // }
}
