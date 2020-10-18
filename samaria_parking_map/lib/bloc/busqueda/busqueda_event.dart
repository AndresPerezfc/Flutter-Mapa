part of 'busqueda_bloc.dart';

@immutable
abstract class BusquedaEvent {}

class OnactivarMarcadorManual extends BusquedaEvent {}

class OnDesactivarMarcadorManual extends BusquedaEvent {}
