import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:samaria_parking_map/models/traffic_Response.dart';

class TrafficService {
  //SingleTon

  TrafficService._privateConstructor();
  static final TrafficService _instance = TrafficService._privateConstructor();
  factory TrafficService() {
    return _instance;
  }

  final _dio = new Dio();
  final _baseUrl = 'https://api.mapbox.com/directions/v5';
  final _apiKey =
      'pk.eyJ1IjoiZmVsaXBlM2FwYyIsImEiOiJja2dmMWM2bWUwaDR0MzRycnZnZXpjMW43In0.OVjBP-e3objuFY54iHj8FQ';

  Future<DrivingResponse> getCoordsInicioYDestino(
      LatLng inicio, LatLng destino) async {
    final coodString =
        '${inicio.longitude},${inicio.latitude};${destino.longitude},${destino.latitude}';
    final url = '${this._baseUrl}/mapbox/driving/$coodString';

    final resp = await this._dio.get(url, queryParameters: {
      'alternatives': 'true',
      'geometries': 'polyline6',
      'steps': 'false',
      'access_token': this._apiKey,
      'language': 'es',
    });

    final data = DrivingResponse.fromJson(resp.data);
    return data;
  }
}
