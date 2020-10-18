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
            )),
        Center(
          child: Transform.translate(
              offset: Offset(0, -20),
              child: Icon(
                Icons.location_on,
                size: 50,
                color: Color(0xff5abd8c),
              )),
        ),
        Positioned(
            bottom: 70,
            left: 40,
            child: MaterialButton(
              minWidth: width - 120,
              child: Text('Confirmar destino',
                  style: TextStyle(color: Colors.white)),
              color: Color(0xff5abd8c),
              elevation: 1,
              shape: StadiumBorder(),
              splashColor: Colors.transparent,
              onPressed: () {},
            )),
      ],
    );
  }
}