import 'package:flutter/material.dart';
import 'package:frenzi/common/component/app_bar/back_bar.dart';
import 'package:frenzi/common/component/layout/layout.dart';
import 'package:frenzi/common/component/text/page_description.dart';
import 'package:frenzi/feature/trips/data/model/trip_model.dart';
import 'package:sizer/sizer.dart';

class DetailedTripScreen extends StatelessWidget {
  const DetailedTripScreen({required this.tripModel, super.key});

  final TripModel tripModel;

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackBar(title: 'Back'),
            SizedBox(height: 30),
            PageDescription(description: tripModel.date),
            PageDescription(description: tripModel.destination),
            PageDescription(description: tripModel.pickup),
            PageDescription(description: tripModel.fare.toString()),
            PageDescription(description: tripModel.latitude.toString()),
            PageDescription(description: tripModel.longitude.toString()),
            PageDescription(
              description: tripModel.numberOfPassengers.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
