import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frenzi/common/component/layout/layout.dart';
import 'package:frenzi/feature/login/presentation/event/login_event.dart';
import 'package:frenzi/feature/login/presentation/view_model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LoginViewModel>(
      context,
    ).add(UserLoginRequested(username: '', password: ''));
    return Layout(child: Text('tete'));
  }
}
