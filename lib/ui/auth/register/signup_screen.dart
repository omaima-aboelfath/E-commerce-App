import 'package:ecommerce_app/ui/utils/custom_text_form_field.dart';
import 'package:ecommerce_app/ui/auth/register/cubit/register_cubit.dart';
import 'package:ecommerce_app/ui/auth/register/cubit/register_states.dart';
import 'package:ecommerce_app/ui/home/home_screen.dart';
import 'package:ecommerce_app/ui/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'sign_up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // put them in register_cubit to separate data from ui
  // var formKey = GlobalKey<FormState>(); // to access data in form
  // TextEditingController nameController = TextEditingController(text: 'omaima');
  // TextEditingController passwordController =
  //     TextEditingController(text: '123456');
  // TextEditingController emailController =
  //     TextEditingController(text: 'omaima@gmail.com');
  // TextEditingController phoneController =
  //     TextEditingController(text: '01098805331');
  // bool isObscure = true;
  RegisterCubit cubit = RegisterCubit();
  @override
  Widget build(BuildContext context) {
    return 
    // BlocProvider( // if u want to share the content of bloc around multiple widgets(like localization, themeing)
    //   create: (context) => cubit,
    BlocListener<RegisterCubit, RegisterStates>(
        bloc: cubit, // (important)if one screen/widget uses blocProvider write this
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoading(context: context, loadingLabel: 'Loading..');
          } else if (state is RegisterErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              message: state.errorMessage,
              title: 'Error',
              posActionName: 'Ok',
            );
          } else if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              message: 'Register Successfully',
              title: 'Success',
              posActionName: 'Ok',
              // posAction: () {
              //   Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              // }
            );
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 60.h, bottom: 30.h, left: 97.h, right: 97.h),
                  child: Image.asset('assets/RouteWhite.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          TextFieldItem(
                            hintText: 'enter your full name',
                            controller: cubit.nameController,
                            text: 'Full Name',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          TextFieldItem(
                            hintText: 'enter your mobile number',
                            controller: cubit.phoneController,
                            text: 'Mobile Number',
                            keyboardType: TextInputType.number,
                            validator: (number) {
                              if (number!.length != 11) {
                                return 'Mobile number must be of 11 digit';
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFieldItem(
                            hintText: 'enter your email address',
                            controller: cubit.emailController,
                            text: 'Email Address',
                            keyboardType: TextInputType.emailAddress,
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
                          ),
                          TextFieldItem(
                            hintText: 'enter your password',
                            controller: cubit.passwordController,
                            keyboardType: TextInputType.number,
                            text: 'Password',
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter password'; // invalid
                              }
                              if (text.length < 6) {
                                return 'Password must be at least 6 digits';
                              }
                              return null; // valid
                            },
                            obscureText: cubit.isObscure,
                            suffixIcon: InkWell(
                                onTap: () {
                                  if (cubit.isObscure) {
                                    cubit.isObscure = false;
                                  } else {
                                    cubit.isObscure = true;
                                  }
                                  setState(() {});
                                },
                                child: cubit.isObscure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                          ),
                          TextFieldItem(
                            hintText: 'confirm your password',
                            controller: cubit.confirmPasswordController,
                            keyboardType: TextInputType.number,
                            text: 'Confirm Password',
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter password'; // invalid
                              }
                              if (text.length < 6) {
                                return 'Password must be at least 6 digits';
                              }
                              return null; // valid
                            },
                            obscureText: cubit.isObscure,
                            suffixIcon: InkWell(
                                onTap: () {
                                  if (cubit.isObscure) {
                                    cubit.isObscure = false;
                                  } else {
                                    cubit.isObscure = true;
                                  }
                                  setState(() {});
                                },
                                child: cubit.isObscure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
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
                              // style: ButtonStyle(
                              //     backgroundColor:
                              //         ),
                              onPressed: () {
                                // Navigator.pushReplacementNamed(
                                //     context, HomeScreen.routeName);
                                // signUp();
                                cubit.register();
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color(0xFF003866),
                                ),
                              ),
                            ),
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

  // void signUp() {
  //   if (cubit.formKey.currentState!.validate() == true) {}
  // }
}
