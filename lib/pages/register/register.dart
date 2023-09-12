import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uilearning_app/pages/register/bloc/register_blocs.dart';
import 'package:uilearning_app/pages/register/bloc/register_events.dart';
import 'package:uilearning_app/pages/register/bloc/register_states.dart';
import 'package:uilearning_app/pages/register/register_controller.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                        child: reusableText(
                            "Enter your details below and free sign up.")),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Username"),
                          buildTextField("Enter your username.", "name", "user",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(UserNameEvents(value));
                          }),
                          reusableText("Email"),
                          buildTextField(
                              "Enter your email adress.", "email", "user",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(EmailEvents(value));
                          }),
                          reusableText("Password"),
                          buildTextField(
                              "Enter your password.", "password", "lock",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordEvents(value));
                          }),
                          reusableText("Re-enter Password"),
                          buildTextField("Re-enter your password to confirm.",
                              "password", "lock", (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RePasswordEvents(value));
                          }),
                          Container(
                              margin: EdgeInsets.only(left: 20.w),
                              child: reusableText(
                                  "By creating an account you have to agree with our them and condition")),
                          buildLogInAndRegisterButton("Sign Up", "login", () {
                            RegisterController(context: context)
                                .handleEmailRegister();
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
