import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frenzi/common/component/app_bar/back_bar.dart';
import 'package:frenzi/common/component/layout/layout.dart';
import 'package:frenzi/common/component/text/page_description.dart';
import 'package:frenzi/common/component/text/page_title.dart';
import 'package:frenzi/common/enum/view_model_status_enum.dart';
import 'package:frenzi/feature/trips/presentation/component/trip_item.dart';
import 'package:frenzi/feature/trips/presentation/event/trips_event.dart';
import 'package:frenzi/feature/trips/presentation/state/trips_state.dart';
import 'package:frenzi/feature/trips/presentation/view_model/trips_view_model.dart';
import 'package:sizer/sizer.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TripsViewModel>(context).add(PreviousTripsRequested());

    return Layout(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackBar(title: 'Home'),
            SizedBox(height: 30),
            PageTitle(title: 'Previous Trips'),
            PageDescription(
              description: 'Tap any trip to view details and book again',
            ),
            SizedBox(height: 15),
            BlocBuilder<TripsViewModel, TripsState>(
              builder: (context, state) {
                final previousTripsStatus = state.previousTripsStatus;
                final previousTripsList = state.previousTripsData;

                if (previousTripsList == null ||
                    previousTripsStatus == ViewModelStatus.error ||
                    previousTripsStatus == ViewModelStatus.loading) {
                  return const SizedBox.shrink();
                }

                var previousTrips = <Widget>[];

                if (previousTripsList.isNotEmpty) {
                  previousTrips = List.generate(previousTripsList.length, (
                    index,
                  ) {
                    return TripItem(tripModel: previousTripsList[index]);
                  });
                }

                return SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0x33FFFFFF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(children: [...previousTrips]),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
