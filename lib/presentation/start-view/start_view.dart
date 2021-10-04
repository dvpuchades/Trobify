import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:trobify/application/auth/auth_bloc.dart';
import 'package:trobify/application/filtros-bloc/filtros_bloc.dart';
import 'package:trobify/application/map-view-bloc/map_view_bloc.dart';
import 'package:trobify/application/search-view-bloc/search_view_bloc.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/domain/map/place_search.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:trobify/presentation/map-view/filters_view.dart';
import 'package:trobify/presentation/map-view/map_view.dart';

class StartView extends StatefulWidget {
  StartView({Key? key}) : super(key: key);

  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  final List<String> _tipoInmuebleFilterOptions = [
    'Vivienda',
    'Habitación',
    'Local',
    'Trastero',
    'Parcela',
    'Garaje',
  ];

  final List<String> _tipoOperacionFilterOptions = ['Alquiler', 'Venta'];
  final FloatingSearchBarController _startBarController = FloatingSearchBarController();
  final _suggestionsSet = <PlaceSearch>{};

  bool searched = false;
  late User userData = User();

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapViewBloc, MapViewState>(
        listener: (context, state) {},
        builder: (mapblocContext, mapblocState) {
          return WillPopScope(
            onWillPop: () async {
              mapblocContext.read<MapViewBloc>().add(MapViewEvent.goToMap(false));
              return false;
            },
            child: mapblocState.onmap
                ? MapView()
                : BlocConsumer<FiltrosBloc, FiltrosState>(
                    listener: (context, state) {},
                    builder: (filtrosblocContext, filtrosblocState) {
                      return Container(
                        decoration: BoxDecoration(color: trobifyColor[1]),
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                alignment: Alignment.topCenter,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Image.asset('assets/images/logo2.png')),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    height: MediaQuery.of(context).size.height * 0.22,
                                    width: MediaQuery.of(context).size.width * 0.85,
                                    top: MediaQuery.of(context).size.height * 0.2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ListTile(
                                            leading:
                                                leadingMaker(Icon(Icons.assignment_outlined), '   Tipo\nOperación', 12),
                                            title: ChipsChoice<String>.multiple(
                                              value: filtrosblocState.tipoOperacionFilterTags,
                                              onChanged: (value) => filtrosblocContext
                                                  .read<FiltrosBloc>()
                                                  .add(FiltrosEvent.tipoOperacionFilterTagsChanged(value)),
                                              choiceItems: C2Choice.listFrom<String, String>(
                                                source: _tipoOperacionFilterOptions,
                                                value: (i, v) => v,
                                                label: (i, v) => v,
                                              ),
                                            ),
                                          ),
                                          divisor,
                                          ListTile(
                                            leading: leadingMaker(Icon(Icons.house), '   Tipo\nInmueble', 12),
                                            title: ChipsChoice<String>.multiple(
                                              value: filtrosblocState.tipoInmuebleFilterTags,
                                              onChanged: (value) => filtrosblocContext
                                                  .read<FiltrosBloc>()
                                                  .add(FiltrosEvent.tipoInmuebleFilterTagsChanged(value)),
                                              choiceItems: C2Choice.listFrom<String, String>(
                                                source: _tipoInmuebleFilterOptions,
                                                value: (i, v) => v,
                                                label: (i, v) => v,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.50,
                                    child: BlocBuilder<SearchViewBloc, SearchViewState>(
                                      builder: (searchblocContext, searchblocState) {
                                        return FloatingSearchBar(
                                          progress: searchblocState.progress,
                                          borderRadius: BorderRadius.circular(25),
                                          transition: CircularFloatingSearchBarTransition(),
                                          transitionDuration: const Duration(milliseconds: 200),
                                          physics: const BouncingScrollPhysics(),
                                          autocorrect: true,
                                          hint: '¿Dónde quieres vivir?',
                                          clearQueryOnClose: false,
                                          accentColor: trobifyColor[1],
                                          backdropColor: Colors.transparent,
                                          controller: _startBarController,
                                          onQueryChanged: (val) {
                                            searchblocContext
                                                .read<SearchViewBloc>()
                                                .add(SearchViewEvent.progressChanged(val != ''));
                                            searchblocContext
                                                .read<SearchViewBloc>()
                                                .add(SearchViewEvent.queryChanged(val, _suggestionsSet));
                                          },
                                          onSubmitted: (_) {},
                                          onFocusChanged: (_) {
                                            searchblocContext
                                                .read<SearchViewBloc>()
                                                .add(SearchViewEvent.progressChanged(false));
                                          },
                                          builder: (BuildContext context, Animation<double> transition) {
                                            return Column(
                                              children: [
                                                _startBarController.query.isNotEmpty
                                                    ? Container()
                                                    : ClipRRect(
                                                        borderRadius: BorderRadius.circular(8),
                                                        child: Material(
                                                          color: Colors.white,
                                                          elevation: 4.0,
                                                          child: BlocBuilder<AuthBloc, AuthState>(
                                                            builder: (context, authState) {
                                                              return authState.map(
                                                                  initial: (_) => Container(),
                                                                  authenticated: (_) => Column(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        children: userData
                                                                            .getHistorial()
                                                                            .map((PlaceSearch sugg) {
                                                                          return ListTile(
                                                                            leading: Icon(Icons.history),
                                                                            title: Text(sugg.description),
                                                                            onTap: () {
                                                                              setState(() {
                                                                                _startBarController.query =
                                                                                    sugg.description;

                                                                                _startBarController.close();
                                                                              });
                                                                              mapblocContext.read<MapViewBloc>().add(
                                                                                  MapViewEvent.setStartLocation(
                                                                                      sugg.placeId));
                                                                              searchblocContext
                                                                                  .read<SearchViewBloc>()
                                                                                  .add(SearchViewEvent.progressChanged(
                                                                                      true));
                                                                            },
                                                                          );
                                                                        }).toList(),
                                                                      ),
                                                                  unauthenticated: (_) => Column(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        children: searchblocState.historial
                                                                            .map<Widget>((PlaceSearch sugg) {
                                                                          return ListTile(
                                                                            leading: Icon(Icons.history),
                                                                            title: Text(sugg.description),
                                                                            onTap: () {
                                                                              setState(() {
                                                                                _startBarController.query =
                                                                                    sugg.description;
                                                                                _startBarController.close();
                                                                              });
                                                                              mapblocContext.read<MapViewBloc>().add(
                                                                                  MapViewEvent.setStartLocation(
                                                                                      sugg.placeId));
                                                                              searchblocContext
                                                                                  .read<SearchViewBloc>()
                                                                                  .add(SearchViewEvent.progressChanged(
                                                                                      true));
                                                                            },
                                                                          );
                                                                        }).toList(),
                                                                      ));
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(8),
                                                  child: Material(
                                                    color: Colors.white,
                                                    elevation: 4.0,
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: _suggestionsSet.map<Widget>((sugg) {
                                                        return ListTile(
                                                          leading: Icon(Icons.place_outlined),
                                                          title: Text(sugg.description),
                                                          onTap: () {
                                                            setState(() {
                                                              _startBarController.query = sugg.description;
                                                              if (userData.getID().isNotEmpty &&
                                                                  userData
                                                                      .getHistorial()
                                                                      .where((s) => s.placeId == sugg.placeId)
                                                                      .isEmpty) {
                                                                userData.addSearchToHistorial(sugg);
                                                              } else if (!searchblocState.historial
                                                                  .where((s) => s.placeId == sugg.placeId)
                                                                  .isEmpty) {
                                                                searchblocState.historial.insert(0, sugg);
                                                                while (searchblocState.historial.length >
                                                                    userData.cantidadSugerencias) {
                                                                  searchblocState.historial.removeLast();
                                                                }
                                                              }
                                                              _startBarController.close();
                                                            });
                                                            mapblocContext
                                                                .read<MapViewBloc>()
                                                                .add(MapViewEvent.setStartLocation(sugg.placeId));
                                                            searchblocContext
                                                                .read<SearchViewBloc>()
                                                                .add(SearchViewEvent.progressChanged(true));
                                                          },
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                ),
                                onPressed: () {
                                  if (_startBarController.query.isNotEmpty) {
                                    mapblocContext.read<MapViewBloc>().add(MapViewEvent.goToMap(true));
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.search, color: trobifyColor[1]),
                                    Text(
                                      'Buscar',
                                      style: TextStyle(color: trobifyColor[1]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
          );
        });
  }
}
