import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;
import 'package:permission_handler/permission_handler.dart';
import 'package:samaria_parking_map/pages/accesso_gps_page.dart';
import 'package:samaria_parking_map/pages/helpers/helpers.dart';
import 'package:samaria_parking_map/pages/mapa_page.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: this.checkGpsYLocation(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text(snapshot.data),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }
      },
    ));
  }

  Future checkGpsYLocation(BuildContext context) async {
    final permisoGPS = await Permission.location.isGranted;
    final gpsActivo = await Geolocator.isLocationServiceEnabled();

    if (permisoGPS && gpsActivo) {
      Navigator.pushReplacement(
          context, navegarMapaFadeIn(context, MapaPage()));
      return '';
    } else if (!permisoGPS) {
      Navigator.pushReplacement(
          context, navegarMapaFadeIn(context, AccesoGpsPage()));
      return 'Asignar permisos';
    } else if (!gpsActivo) {
      return 'Activar Permisos';
    }

    //Navigator.pushReplacement(context, navegarMapaFadeIn(context, MapaPage()));
    //Navigator.pushReplacement(context, navegarMapaFadeIn(context, AccesoGpsPage()));
  }
}
