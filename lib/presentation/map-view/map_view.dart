import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trobify/application/filtros-bloc/filtros_bloc.dart';
import 'package:trobify/application/map-view-bloc/map_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trobify/presentation/card-view/list_card.dart';
import 'package:trobify/presentation/card-view/map_card.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'search_view.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
part 'refresh_widget.dart';

class MapView extends StatefulWidget {
  const MapView({
    Key? key,
  }) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapViewBloc, MapViewState>(
      listener: (context, state) {},
      builder: (mapblocContext, blocState) {
        return SlidingSheet(
          headerBuilder: (context, state) => Container(
            padding: EdgeInsets.symmetric(vertical: 25),
            width: double.maxFinite,
            child: Text(
              'Lista',
              style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
              textAlign: TextAlign.center,
            ),
          ),
          elevation: 8,
          cornerRadius: 25,
          duration: Duration(milliseconds: 600),
          backdropColor: trobifyColor[1]!.withAlpha(120),
          closeOnBackButtonPressed: true,
          addTopViewPaddingOnFullscreen: true,
          snapSpec: const SnapSpec(
              // Enable snapping. This is true by default.
              snap: true,
              // Set custom snapping points.
              snappings: [0.10, 0.38, 1.0],
              // Define to what the snappings relate to. In this case,
              // the total available space that the sheet can expand to.
              positioning: SnapPositioning.relativeToSheetHeight,
              initialSnap: 0.1),
          maxWidth: MediaQuery.of(context).size.height,
          // The body widget will be displayed under the SlidingSheet
          // and a parallax effect can be applied to it.
          body: BlocBuilder<FiltrosBloc, FiltrosState>(
            builder: (filtrosblocContext, filtrosblocState) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: blocState.myLocation,
                      zoom: 15,
                    ),
                    onMapCreated: (mapController) {
                      mapblocContext.read<MapViewBloc>().add(MapViewEvent.onMapCreated(mapController, context));
                      Future.delayed(
                        Duration(seconds: 2, milliseconds: 500),
                      ).then((value) {
                        mapblocContext.read<MapViewBloc>().add(MapViewEvent.refreshItems(context, filtrosblocState));
                      });
                    },
                    onCameraIdle: () => mapblocContext.read<MapViewBloc>().add(MapViewEvent.onMapMoved()),
                    markers: blocState.markers,
                    myLocationEnabled: true,
                    mapType: MapType.hybrid,
                    zoomControlsEnabled: false,
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 135,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.width * 0.20,
                    ),
                    alignment: Alignment.bottomCenter,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: PageScrollPhysics(),
                      itemCount: blocState.inmuebles.length,
                      controller: blocState.scrollController,
                      itemBuilder: (context, index) {
                        return MapCard(inmueble: blocState.inmuebles[index]);
                      },
                    ),
                  ),
                  RefreshWidget(
                    onPressed: () =>
                        mapblocContext.read<MapViewBloc>().add(MapViewEvent.refreshItems(context, filtrosblocState)),
                  ),
                  // this is the search bar
                  SearchView(
                      mapController: blocState.mapController,
                      mapblocContext: mapblocContext,
                      mapblocState: blocState,
                      mapContext: context),
                ],
              );
            },
          ),
          builder: (context, state) {
            // This is the content of the sheet that will get
            // scrolled, if the content is bigger than the available
            // height of the sheet.
            return Container(
              height: MediaQuery.of(context).size.height,
              child: blocState.inmuebles.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.25),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      addAutomaticKeepAlives: true,
                      itemCount: blocState.inmuebles.length,
                      itemBuilder: (context, index) {
                        return ListCard(inmueble: blocState.inmuebles[index]);
                      },
                    )
                  : Center(child: Text('No hay inmuebles en esta zona')),
            );
          },
        );
      },
    );
  }
}
