import 'package:flutter/material.dart';
import 'package:frenzi/common/theme/theme.dart';
import 'package:sizer/sizer.dart';

class TripDetailsItem extends StatelessWidget {
  const TripDetailsItem({required this.icon, required this.detail, super.key});

  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: textWhite, size: 20),
        SizedBox(height: 5),
        Text(
          detail,
          style: TextStyle(
            color: textWhite,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
