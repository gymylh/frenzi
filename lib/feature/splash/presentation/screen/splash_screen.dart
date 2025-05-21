import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:frenzi/common/component/button/custom_button.dart';
import 'package:frenzi/common/component/layout/layout.dart';
import 'package:frenzi/common/route/location/location.dart';
import 'package:frenzi/common/theme/theme.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
            Text('Frenzi', style: TextStyle(color: textWhite, fontSize: 28.sp)),
            CustomButton(
              onPressed: () {
                context.beamToNamed(LoginLocation.route);
              },
              isDeactivated: false,
              height: null,
              width: 50.w,
              color: primaryColor,
              children: [
                Text(
                  'PROCEED TO LOGIN',
                  style: TextStyle(
                    color: textWhite,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
