import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:frenzi/feature/trips/data/model/trip_model.dart';
import 'package:http/http.dart' as http;

class TripsRemoteSource {
  TripsRemoteSource(this._httpClient);

  final Dio _httpClient;

  http.Client client = http.Client();

  Future<List<TripModel>> getPreviousTrips() async {
    try {
      // final response = await _httpClient.get<List<dynamic>>(
      //   'api/previous-trips',
      //   options: Options(
      //     responseType: ResponseType.plain,
      //   ),
      // );
      // if (response.statusCode == 200) {
      //   final body = response.data ?? [];
      //
      //   final result = body.map((item) {
      //     if (item == null) return const TripModel.empty();
      //     return TripModel.fromJson(item as Map<String, dynamic>);
      //   }).toList();
      //   return result;
      // } else {
      //   throw Exception();
      // }

      String response = await rootBundle.loadString(
        'assets/sample_json/previous_trips_response.json',
      );
      List<dynamic> jsonBody = json.decode(response);

      final result =
          jsonBody.map((item) {
            return TripModel.fromJson(item);
          }).toList();
      return result;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
