import 'package:equatable/equatable.dart';

class TripModel extends Equatable {
  const TripModel({
    required this.pickup,
    required this.destination,
    required this.date,
    required this.numberOfPassengers,
    required this.fare,
    required this.latitude,
    required this.longitude,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      pickup: json['pickup'] as String? ?? '',
      destination: json['destination'] as String? ?? '',
      date: json['date'] as String? ?? '',
      numberOfPassengers: json['numberOfPassengers'] as int? ?? 0,
      fare: json['fare'] as double? ?? 0.0,
      latitude: json['latitude'] as double? ?? 0.0,
      longitude: json['longitude'] as double? ?? 0.0,
    );
  }

  const TripModel.empty()
    : pickup = '',
      destination = '',
      date = '',
      numberOfPassengers = 0,
      fare = 0.0,
      latitude = 0.0,
      longitude = 0.0;

  final String pickup;
  final String destination;
  final String date;
  final int numberOfPassengers;
  final double fare;
  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [
    pickup,
    destination,
    date,
    numberOfPassengers,
    fare,
    latitude,
    longitude,
  ];
}
