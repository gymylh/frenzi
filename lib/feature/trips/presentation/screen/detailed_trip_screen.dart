import 'package:flutter/material.dart';
import 'package:frenzi/common/component/app_bar/back_bar.dart';
import 'package:frenzi/common/component/button/custom_button.dart';
import 'package:frenzi/common/component/layout/layout.dart';
import 'package:frenzi/common/component/text/page_title.dart';
import 'package:frenzi/common/helper/string_helper.dart';
import 'package:frenzi/common/theme/theme.dart';
import 'package:frenzi/feature/trips/data/model/trip_model.dart';
import 'package:frenzi/feature/trips/presentation/component/trip_details_location_item.dart';
import 'package:frenzi/feature/trips/presentation/component/trip_details_item.dart';
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
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackBar(title: 'Back'),
              SizedBox(height: 30),
              PageTitle(title: tripModel.destination),

              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TripDetailsLocationItem(
                      isDestination: false,
                      place: tripModel.pickup,
                    ),
                    SizedBox(height: 20),
                    TripDetailsLocationItem(
                      isDestination: true,
                      place: tripModel.destination,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TripDetailsLocationItem(
                      isDestination: false,
                      place: tripModel.pickupLatitude.toString(),
                    ),
                    TripDetailsLocationItem(
                      isDestination: false,
                      place: tripModel.pickupLongitude.toString(),
                    ),
                    SizedBox(height: 20),
                    TripDetailsLocationItem(
                      isDestination: true,
                      place: tripModel.destinationLatitude.toString(),
                    ),
                    TripDetailsLocationItem(
                      isDestination: true,
                      place: tripModel.destinationLongitude.toString(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                width: 100.w,
                decoration: BoxDecoration(
                  color: Color(0x33FFFFFF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TripDetailsItem(
                          icon: Icons.calendar_month,
                          detail: tripModel.date.formatDateTime(),
                        ),
                        TripDetailsItem(
                          icon: Icons.people,
                          detail: tripModel.numberOfPassengers.toString(),
                        ),
                        TripDetailsItem(
                          icon: Icons.currency_pound,
                          detail: '£${tripModel.fare.toString()}',
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: CustomButton(
                        onPressed: () {},
                        isDeactivated: false,
                        height: null,
                        width: 100.w,
                        color: primaryColor,
                        children: [
                          Text(
                            'BOOK AGAIN',
                            style: TextStyle(
                              color: textWhite,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_right_alt,
                            color: textWhite,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
