import 'package:flutter/material.dart';
import 'package:frenzi/common/theme/theme.dart';
import 'package:sizer/sizer.dart';

class PageDescription extends StatelessWidget {
  const PageDescription({required this.description, super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        color: textWhite,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
