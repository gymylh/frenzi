import 'package:flutter/material.dart';
import 'package:frenzi/common/theme/theme.dart';
import 'package:sizer/sizer.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: textWhite,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
