part of 'map_view.dart';

class RefreshWidget extends StatelessWidget {
  final Function() onPressed;
  const RefreshWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapViewBloc, MapViewState>(
      builder: (context, state) {
        return Container(
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: state.refreshOpacity,
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  elevation: 10,
                ),
                onPressed: onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh_outlined),
                    Text('Buscar en esta zona'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
