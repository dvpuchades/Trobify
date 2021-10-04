import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:trobify/application/auth/auth_bloc.dart';
import 'package:trobify/application/filtros-bloc/filtros_bloc.dart';
import 'package:trobify/application/map-view-bloc/map_view_bloc.dart';
import 'package:trobify/application/search-view-bloc/search_view_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/domain/map/place_search.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:trobify/presentation/map-view/filters_view.dart';

class SearchView extends StatefulWidget {
  final GoogleMapController? mapController;
  final BuildContext mapblocContext;
  final MapViewState mapblocState;
  final BuildContext mapContext;
  const SearchView(
      {Key? key,
      required this.mapController,
      required this.mapblocContext,
      required this.mapblocState,
      required this.mapContext})
      : super(key: key);
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _searchBarController = FloatingSearchBarController();
  final _suggestionsSet = <PlaceSearch>{};
  final userData = User();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchViewBloc>(
          create: (searchblocContext) => SearchViewBloc(),
        ),
      ],
      child: BlocConsumer<SearchViewBloc, SearchViewState>(
        listener: (searchblocContext, searchblocState) {},
        builder: (searchblocContext, searchblocState) {
          return BlocConsumer<FiltrosBloc, FiltrosState>(
              listener: (filtrosblocContext, filtrosblocState) {},
              builder: (filtrosblocContext, filtrosblocState) {
                return FloatingSearchBar(
                  controller: _searchBarController,
                  onQueryChanged: (val) {
                    searchblocContext.read<SearchViewBloc>().add(SearchViewEvent.progressChanged(val != ''));
                    searchblocContext.read<SearchViewBloc>().add(SearchViewEvent.queryChanged(val, _suggestionsSet));
                  },
                  progress: searchblocState.progress,
                  borderRadius: BorderRadius.circular(25),
                  hint: '¿Dónde quieres vivir?',
                  backdropColor: trobifyColor[1]!.withAlpha(120),
                  onSubmitted: (_) => searchblocContext.read<SearchViewBloc>().add(SearchViewEvent.searchAndNavigate(
                      widget.mapController,
                      _searchBarController,
                      widget.mapblocContext,
                      widget.mapblocState,
                      widget.mapContext,
                      searchblocState.searchAddress,
                      filtrosblocState)),
                  transition: CircularFloatingSearchBarTransition(),
                  transitionDuration: const Duration(milliseconds: 650),
                  physics: const BouncingScrollPhysics(),
                  autocorrect: true,
                  clearQueryOnClose: false,
                  accentColor: trobifyColor[1],
                  onFocusChanged: (_) {
                    searchblocContext.read<SearchViewBloc>().add(SearchViewEvent.progressChanged(false));
                  },
                  leadingActions: [
                    IconButton(
                        icon: Icon(Icons.filter_list_outlined),
                        onPressed: () {
                          _filtersBottomSheet(context);
                        }),
                  ],
                  builder: (context, transition) {
                    return Column(
                      children: [
                        _searchBarController.query.isNotEmpty
                            ? Container()
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Material(
                                  color: Colors.white,
                                  elevation: 4.0,
                                  child: BlocBuilder<AuthBloc, AuthState>(
                                    builder: (context, state) {
                                      return state.map(
                                          initial: (_) => Container(),
                                          authenticated: (_) => Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: userData.getHistorial().map((PlaceSearch sugg) {
                                                  return ListTile(
                                                    leading: Icon(Icons.history),
                                                    title: Text(sugg.description),
                                                    onTap: () {
                                                      setState(() {
                                                        _searchBarController.query = sugg.description;
                                                      });
                                                      searchblocContext
                                                          .read<SearchViewBloc>()
                                                          .add(SearchViewEvent.progressChanged(true));
                                                      searchblocContext.read<SearchViewBloc>().add(
                                                          SearchViewEvent.searchAndNavigate(
                                                              widget.mapController,
                                                              _searchBarController,
                                                              widget.mapblocContext,
                                                              widget.mapblocState,
                                                              widget.mapContext,
                                                              sugg.placeId,
                                                              filtrosblocState));
                                                    },
                                                  );
                                                }).toList(),
                                              ),
                                          unauthenticated: (_) => Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: searchblocState.historial.map<Widget>((PlaceSearch sugg) {
                                                  return ListTile(
                                                    leading: Icon(Icons.history),
                                                    title: Text(sugg.description),
                                                    onTap: () {
                                                      setState(() {
                                                        _searchBarController.query = sugg.description;
                                                      });
                                                      searchblocContext
                                                          .read<SearchViewBloc>()
                                                          .add(SearchViewEvent.progressChanged(true));
                                                      searchblocContext.read<SearchViewBloc>().add(
                                                          SearchViewEvent.searchAndNavigate(
                                                              widget.mapController,
                                                              _searchBarController,
                                                              widget.mapblocContext,
                                                              widget.mapblocState,
                                                              widget.mapContext,
                                                              sugg.placeId,
                                                              filtrosblocState));
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
                                      _searchBarController.query = sugg.description;
                                      if (userData.getID().isNotEmpty) {
                                        userData.addSearchToHistorial(sugg);
                                      } else {
                                        searchblocState.historial.insert(0, sugg);
                                        while (searchblocState.historial.length > userData.cantidadSugerencias) {
                                          searchblocState.historial.removeLast();
                                        }
                                      }
                                    });
                                    searchblocContext.read<SearchViewBloc>().add(SearchViewEvent.progressChanged(true));
                                    searchblocContext.read<SearchViewBloc>().add(SearchViewEvent.searchAndNavigate(
                                        widget.mapController,
                                        _searchBarController,
                                        widget.mapblocContext,
                                        widget.mapblocState,
                                        widget.mapContext,
                                        sugg.placeId,
                                        filtrosblocState));
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
              });
        },
      ),
    );
  }

  void _filtersBottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        )),
        context: context,
        builder: (BuildContext bc) {
          return BlocProvider.value(
            value: BlocProvider.of<FiltrosBloc>(context),
            child: FiltersView(
              mapblocContext: widget.mapblocContext,
              mapContext: widget.mapContext,
            ),
          );
        });
  }
}
