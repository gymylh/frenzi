import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frenzi/common/component/app_bar/back_bar.dart';
import 'package:frenzi/common/component/layout/layout.dart';
import 'package:frenzi/common/component/text/page_description.dart';
import 'package:frenzi/common/component/text/page_title.dart';
import 'package:frenzi/common/enum/view_model_status_enum.dart';
import 'package:frenzi/common/theme/theme.dart';
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

                var previousTrips = <TripItem>[];

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
                  child:
                      (previousTripsStatus == ViewModelStatus.success &&
                              previousTripsList.isNotEmpty)
                          ? SingleChildScrollView(
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
                          )
                          : (previousTripsStatus == ViewModelStatus.success &&
                              previousTripsList.isEmpty)
                          ? EmptyState()
                          : previousTripsStatus == ViewModelStatus.loading
                          ? LoadingState()
                          : ErrorState(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: primaryColor));
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<TripsViewModel>(
            context,
          ).add(PreviousTripsRequested());
        },
        child: Text(
          'No previous trips found.\nTap to retry!',
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.5,
            fontWeight: FontWeight.normal,
            color: textWhite,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class ErrorState extends StatelessWidget {
  const ErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<TripsViewModel>(
            context,
          ).add(PreviousTripsRequested());
        },
        child: Text(
          'Something went wrong.\nTap to retry!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: textWhite,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
