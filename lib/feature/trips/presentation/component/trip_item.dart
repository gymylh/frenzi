import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:frenzi/common/helper/string_helper.dart';
import 'package:frenzi/common/route/location/detailed_trip_location.dart';
import 'package:frenzi/common/theme/theme.dart';
import 'package:frenzi/feature/trips/data/model/trip_model.dart';
import 'package:sizer/sizer.dart';

class TripItem extends StatelessWidget {
  const TripItem({required this.tripModel, super.key});

  final TripModel tripModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          context.beamToNamed(DetailedTripLocation.route, data: tripModel);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    tripModel.destination.toUpperCase(),
                    maxLines: 2,
                    style: TextStyle(
                      color: textWhite,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'TRIP INFO',
                        style: TextStyle(
                          color: textWhite,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_right_alt, color: textWhite, size: 20),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'From ${tripModel.pickup}',
                  style: TextStyle(
                    color: textWhite,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  tripModel.date.formatDateTime(),
                  style: TextStyle(
                    color: textWhite,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
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
