import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frenzi/app.dart';
import 'package:frenzi/common/helper/shared_pref_util.dart';

final dio = Dio();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefUtil.init();
  runApp(const MyApp());
}
