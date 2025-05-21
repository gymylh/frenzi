import 'package:equatable/equatable.dart';

class TripModel extends Equatable {
  const TripModel({
    required this.pickup,
    required this.destination,
    required this.date,
    required this.numberOfPassengers,
    required this.fare,
    required this.pickupLatitude,
    required this.pickupLongitude,
    required this.destinationLatitude,
    required this.destinationLongitude,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      pickup: json['pickup'] as String? ?? '',
      destination: json['destination'] as String? ?? '',
      date: json['date'] as String? ?? '',
      numberOfPassengers: json['numberOfPassengers'] as int? ?? 0,
      fare: json['fare'] as double? ?? 0.0,
      pickupLatitude: json['pickupLatitude'] as double? ?? 0.0,
      pickupLongitude: json['pickupLongitude'] as double? ?? 0.0,
      destinationLatitude: json['destinationLatitude'] as double? ?? 0.0,
      destinationLongitude: json['destinationLongitude'] as double? ?? 0.0,
    );
  }

  const TripModel.empty()
    : pickup = '',
      destination = '',
      date = '',
      numberOfPassengers = 0,
      fare = 0.0,
      pickupLatitude = 0.0,
      pickupLongitude = 0.0,
      destinationLatitude = 0.0,
      destinationLongitude = 0.0;

  final String pickup;
  final String destination;
  final String date;
  final int numberOfPassengers;
  final double fare;
  final double pickupLatitude;
  final double pickupLongitude;
  final double destinationLatitude;
  final double destinationLongitude;

  @override
  List<Object?> get props => [
    pickup,
    destination,
    date,
    numberOfPassengers,
    fare,
    pickupLatitude,
    pickupLongitude,
    destinationLatitude,
    destinationLongitude,
  ];
}
