import 'package:flutter/material.dart';
import 'package:frenzi/common/theme/theme.dart';
import 'package:sizer/sizer.dart';

class TripDetailsLocationItem extends StatelessWidget {
  const TripDetailsLocationItem({
    required this.isDestination,
    required this.place,
    super.key,
  });

  final bool isDestination;
  final String place;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              isDestination ? Icons.pin_drop : Icons.my_location,
              color: primaryColor,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              isDestination ? 'DESTINATION' : 'PICKUP',
              maxLines: 2,
              style: TextStyle(
                color: primaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          place,
          style: TextStyle(
            color: textBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
