part of 'mapa_bloc.dart';

@immutable
class MapaState {
  final bool mapaListo;
  final bool dibujarRecorrido;

  //PolyLines
  final Map<String, Polyline> polylines;

  MapaState(
      {this.mapaListo = false,
      this.dibujarRecorrido = true,
      Map<String, Polyline> polylines})
      : this.polylines = polylines ?? new Map();

  MapaState copyWith({
    bool mapaListo,
    bool dibujarRecorrido,
  }) =>
      MapaState(
          mapaListo: mapaListo ?? this.mapaListo,
          dibujarRecorrido: dibujarRecorrido ?? this.dibujarRecorrido,
          polylines: polylines ?? this.polylines);
}
