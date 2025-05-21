import 'package:beamer/beamer.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frenzi/common/component/button/custom_button.dart';
import 'package:frenzi/common/component/layout/layout.dart';
import 'package:frenzi/common/enum/view_model_status_enum.dart';
import 'package:frenzi/common/route/location/location.dart';
import 'package:frenzi/common/theme/theme.dart';
import 'package:frenzi/feature/login/presentation/component/input_label.dart';
import 'package:frenzi/feature/login/presentation/component/input_text_field.dart';
import 'package:frenzi/feature/login/presentation/event/login_event.dart';
import 'package:frenzi/feature/login/presentation/state/login_state.dart';
import 'package:frenzi/feature/login/presentation/view_model/login_view_model.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var isEmailValid = false;
  var isPasswordValid = false;

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onEmailQueryChanged(String query) async {
      if (query.isNotEmpty) {
        setState(() {
          isEmailValid = EmailValidator.validate(query);
        });
      }
    }

    Future<void> onPasswordQueryChanged(String query) async {
      if (query.isNotEmpty) {
        setState(() {
          isPasswordValid = query.length >= 6;
        });
      }
    }

    return BlocListener<LoginViewModel, LoginState>(
      listener: (context, state) {
        if (state.loginStatus == ViewModelStatus.success) {
          context.beamToNamed(TripsLocation.route);
        }
      },
      child: Layout(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: textWhite,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 60),
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputLabel(text: 'EMAIL'),
                          SizedBox(height: 10),
                          InputTextField(
                            controller: emailTextController,
                            onChangeQuery: onEmailQueryChanged,
                            hint: 'Your email address',
                          ),
                          SizedBox(height: 20),
                          InputLabel(text: 'PASSWORD'),
                          SizedBox(height: 10),
                          InputTextField(
                            controller: passwordTextController,
                            onChangeQuery: onPasswordQueryChanged,
                            hint: 'Your password',
                            obscure: true,
                          ),
                          SizedBox(height: 30),
                          Center(
                            child: CustomButton(
                              onPressed: () {
                                if (isEmailValid && isPasswordValid) {
                                  BlocProvider.of<LoginViewModel>(context).add(
                                    UserLoginRequested(
                                      email: emailTextController.text,
                                      password: passwordTextController.text,
                                    ),
                                  );
                                }
                              },
                              isDeactivated: !(isEmailValid && isPasswordValid),
                              height: null,
                              width: 50.w,
                              color: primaryColor,
                              children: [
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: textWhite,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: '',
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'New driver? ',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Create an account',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '',
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Need help? ',
                            style: TextStyle(
                              color: textWhite,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Contact us',
                            style: TextStyle(
                              color: textWhite,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'FRENZI DRIVER APP V2.6.0',
                      style: TextStyle(
                        color: textWhite,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
