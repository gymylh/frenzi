import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:frenzi/common/theme/theme.dart';
import 'package:sizer/sizer.dart';

class BackBar extends StatelessWidget {
  const BackBar({this.onBackButtonPressed, this.title, super.key});

  final void Function()? onBackButtonPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _BackButton(onBackButtonPressed: onBackButtonPressed),
          if ((title?.isNotEmpty ?? false) && title != null) ...[
            GestureDetector(
              onTap: onBackButtonPressed ?? () => Beamer.of(context).beamBack(),
              child: Text(
                title ?? '',
                style: TextStyle(
                  color: textWhite,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onBackButtonPressed});

  final void Function()? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onBackButtonPressed ?? () => Beamer.of(context).beamBack(),
      child: Icon(Icons.arrow_back_ios, color: textWhite, size: 20),
    );
  }
}
