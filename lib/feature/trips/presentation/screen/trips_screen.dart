import 'package:flutter/material.dart';
import 'package:frenzi/common/component/layout/layout.dart';
import 'package:frenzi/common/theme/theme.dart';
import 'package:sizer/sizer.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Trips', style: TextStyle(color: textWhite, fontSize: 28.sp)),
          ],
        ),
      ),
    );
  }
}
