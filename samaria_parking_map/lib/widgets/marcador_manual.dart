part of 'widgets.dart';

class MarcadorManual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusquedaBloc, BusquedaState>(
      builder: (context, state) {
        if (state.seleccionManual) {
          return _BuildMarcadorManual();
        } else {
          return Container();
        }
      },
    );
  }
}

class _BuildMarcadorManual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
            top: 70,
            left: 20,
            child: FadeInLeft(
              duration: Duration(milliseconds: 150),
              child: CircleAvatar(
                maxRadius: 25,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xff5abd8c),
                  ),
                  onPressed: () {
                    context
                        .bloc<BusquedaBloc>()
                        .add(OnDesactivarMarcadorManual());
                  },
                ),
              ),
            )),
        Center(
          child: Transform.translate(
              offset: Offset(0, -20),
              child: BounceInDown(
                child: Icon(
                  Icons.location_on,
                  size: 50,
                  color: Color(0xff5abd8c),
                ),
              )),
        ),
        Positioned(
            bottom: 70,
            left: 40,
            child: FadeIn(
              child: MaterialButton(
                minWidth: width - 120,
                child: Text('Confirmar destino',
                    style: TextStyle(color: Colors.white)),
                color: Color(0xff5abd8c),
                elevation: 1,
                shape: StadiumBorder(),
                splashColor: Colors.transparent,
                onPressed: () {
                  this.calcularDestino(context);
                },
              ),
            )),
      ],
    );
  }

  void calcularDestino(BuildContext context) async {
    final trafficService = new TrafficService();
    final inicio = context.bloc<MiUbicacionBloc>().state.ubicacion;
    final destino = context.bloc<MapaBloc>().state.ubicacionCentral;

    final trafficResponse =
        await trafficService.getCoordsInicioYDestino(inicio, destino);

    final geometry = trafficResponse.routes[0].geometry;
    final duracion = trafficResponse.routes[0].duration;
    final distancia = trafficResponse.routes[0].distance;
    //Decodificar los puntos del geometry

    final points = Poly.Polyline.Decode(encodedString: geometry, precision: 6)
        .decodedCoords;

    final temp = points;
  }
}
