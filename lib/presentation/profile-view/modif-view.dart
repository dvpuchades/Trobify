import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:trobify/application/create-bloc/create_bloc_bloc.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/domain/map/places_service.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/presentation/core/photoBottomSheet.dart';
import 'package:textfield_tags/textfield_tags.dart';

import 'my-inmuebles-view.dart';

class ModificarInmueble extends StatefulWidget {
  final Inmueble inmueble;

  @override
  _ModificarInmuebleState createState() => _ModificarInmuebleState();

  ModificarInmueble(Inmueble inmueble) : inmueble = inmueble;
}

class _ModificarInmuebleState extends State<ModificarInmueble> {
  List<File> imageList = [];
  var contrato = 'Venta';
  late Icon _deleteIcon;

  DateFormat format = DateFormat('dd/MM/yyyy');
  DateTime calendarInitDate = DateTime.now();

  DateTime disponibilidad = DateTime.now();
  var servicios = <String>[];
  var serviciosAdded = <String>[];

  final _key = GlobalKey<FormState>();
  var photosRefList = <String>[];

  List<String> loadedImages = [];
  List<ImageWithURL> photoList = [];

  @override
  void initState() {
    initializeDateFormatting();
    _deleteIcon = Icon(Icons.delete_outline);
    widget.inmueble.fotos.forEach((element) {
      if (element != null) {
        loadedImages.add(element);
      }
    });
    photoList = tuListImage(loadedImages, imageList);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CreateBlocBloc.modif(widget.inmueble),
        child: BlocConsumer<CreateBlocBloc, CreateBlocState>(
            listener: (context, state) {},
            builder: (blocContext, state) {
              return Scaffold(
                  body: Form(
                    key: _key,
                    child: ListView(
                      padding: const EdgeInsets.all(25.0),
                      children: <Widget>[
                        photoList.isEmpty
                            ? Container(
                                height: MediaQuery.of(context).size.height * 0.25,
                                child: IconButton(
                                  icon: Image.asset('assets/images/add_photos.png'),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return PhotoBottomSheet(
                                          onTapCamera: () {
                                            getImage(context, ImageSource.camera);
                                          },
                                          onTapGallery: () {
                                            getImage(context, ImageSource.gallery);
                                          },
                                          image: null,
                                        );
                                      },
                                    );
                                  },
                                ))
                            : Container(
                                height: MediaQuery.of(context).size.height * 0.25,
                                child: setImageView(context),
                              ),
                        Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Modificar Anuncio',
                              style: TitleTextStyle,
                              textAlign: TextAlign.center,
                            )),
                        Container(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              initialValue: state.direccion,
                              decoration: InputDecoration(
                                  hintText: 'Dirección',
                                  labelText: 'DIRECCIÓN',
                                  labelStyle: TextStyle(letterSpacing: 4, fontSize: 12)),
                              keyboardType: TextInputType.streetAddress,
                              onChanged: (texto) =>
                                  blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.direccionChanged(texto)),
                              validator: (texto) {
                                if (texto!.isEmpty) {
                                  return 'Dirección obligatoria';
                                }
                                return null;
                              },
                            )),
                        Row(children: <Widget>[
                          Expanded(
                              child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                      initialValue: state.ciudad,
                                      decoration: InputDecoration(
                                          hintText: 'Ciudad',
                                          labelText: 'CIUDAD',
                                          labelStyle: TextStyle(letterSpacing: 4, fontSize: 12)),
                                      onChanged: (texto) =>
                                          blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.ciudadChanged(texto)),
                                      validator: (texto) {
                                        if (texto!.isEmpty) {
                                          return 'Ciudad obligatoria';
                                        }
                                        return null;
                                      }))),
                          Expanded(
                              child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    initialValue: state.codigoPostal == 0 ? null : state.codigoPostal.toString(),
                                    decoration: InputDecoration(
                                        hintText: 'Código Postal',
                                        labelText: 'CÓDIGO POSTAL',
                                        labelStyle: TextStyle(letterSpacing: 4, fontSize: 12)),
                                    onChanged: (texto) => blocContext
                                        .read<CreateBlocBloc>()
                                        .add(CreateBlocEvent.codigoPostalChanged(int.parse(texto))),
                                    keyboardType: TextInputType.number,
                                    validator: (texto) {
                                      if (texto!.isEmpty) {
                                        return 'Código Postal obligatorio';
                                      }
                                      if (texto.length != 5) {
                                        return 'Código Postal no valido';
                                      }
                                      return null;
                                    },
                                  )))
                        ]),
                        Container(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              initialValue: state.descripcion,
                              decoration: InputDecoration(
                                  hintText: 'Descripción',
                                  labelText: 'DESCRIPCIÓN',
                                  labelStyle: TextStyle(letterSpacing: 4, fontSize: 12)),
                              onChanged: (texto) =>
                                  blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.descripcionChanged(texto)),
                              validator: (texto) {
                                if (texto!.isEmpty) {
                                  return 'Descripción obligatoria';
                                }
                                return null;
                              },
                            )),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Fecha de disponibilidad:',
                            style: AppBarTextStyle,
                          ),
                        ),

                        Container(
                            padding: const EdgeInsets.all(10.0),
                            child: CalendarTimeline(
                              showYears: true,
                              locale: 'es',
                              firstDate: state.disponibilidad,
                              initialDate: state.disponibilidad,
                              onDateSelected: (date) =>
                                  blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.disponibilidadChanged(date)),
                              lastDate: calendarInitDate.add(Duration(days: 700)),
                              activeBackgroundDayColor: Colors.amber,
                              dayColor: Colors.amber,
                            )),

                        Container(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                                initialValue: state.precio == 0 ? null : state.precio.round().toString(),
                                decoration: InputDecoration(
                                    hintText: 'Precio',
                                    labelText: 'PRECIO',
                                    labelStyle: TextStyle(letterSpacing: 4, fontSize: 12)),
                                onChanged: (texto) {
                                  blocContext
                                      .read<CreateBlocBloc>()
                                      .add(CreateBlocEvent.precioChanged(double.parse(texto)));
                                },
                                validator: (texto) {
                                  if (texto!.isEmpty) {
                                    return 'Precio obligatorio';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number)),
                        Container(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              initialValue: state.superficie == 0 ? null : state.superficie.round().toString(),
                              decoration: InputDecoration(
                                  hintText: 'Superficie (m²)',
                                  labelText: 'SUPERFICIE',
                                  labelStyle: TextStyle(letterSpacing: 4, fontSize: 12)),
                              keyboardType: TextInputType.number,
                              onChanged: (texto) => blocContext
                                  .read<CreateBlocBloc>()
                                  .add(CreateBlocEvent.superficieChanged(double.parse(texto))),
                              validator: (texto) {
                                if (texto!.isEmpty) {
                                  return 'Superficie obligatoria';
                                }
                                return null;
                              },
                            )),
                        Container(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFieldTags(
                              initialTags: state.servicios,
                              tagsStyler: TagsStyler(
                                  tagTextStyle: TextStyle(fontWeight: FontWeight.normal),
                                  tagDecoration: BoxDecoration(
                                    color: Colors.amber[300],
                                    borderRadius: BorderRadius.circular(202.0),
                                  ),
                                  tagCancelIcon: Icon(Icons.cancel, size: 18.0, color: Colors.amber[100]),
                                  tagPadding: const EdgeInsets.all(6.0)),
                              textFieldStyler: TextFieldStyler(
                                hintText: 'Servicios',
                                helperText: 'Introduzca los servicios ofrecidos',
                              ),
                              onTag: (tag) {
                                serviciosAdded.add(tag);
                              },
                              onDelete: (tag) {
                                serviciosAdded.removeWhere((element) => element == tag);
                              },
                            )),
                        Container(
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: state.tipoInmueble,
                              elevation: 16,
                              style: const TextStyle(color: Colors.amber),
                              underline: Container(
                                height: 2,
                                color: Colors.amber,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  blocContext
                                      .read<CreateBlocBloc>()
                                      .add(CreateBlocEvent.tipoInmuebleChanged(newValue!));
                                });
                              },
                              items: <String>[
                                'Vivienda',
                                'Trastero',
                                'Parcela',
                                'Habitación',
                                'Local',
                                'Garaje',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  onTap: () {
                                    blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.tipoInmuebleChanged(value));
                                  },
                                  child: Text(value),
                                );
                              }).toList(),
                            )),
                        Container(
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: state.tipoOperacion,
                              elevation: 16,
                              style: const TextStyle(color: Colors.amber),
                              underline: Container(
                                height: 2,
                                color: Colors.amber,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  blocContext
                                      .read<CreateBlocBloc>()
                                      .add(CreateBlocEvent.tipoOperacionChanged(newValue!));

                                  if (state.tipoOperacion == 'Alquiler') {
                                    blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.formatoPrecioChanged(30));
                                  } else if (state.tipoOperacion == 'Venta') {
                                    blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.formatoPrecioChanged(99));
                                  }
                                });
                              },
                              items: <String>['Venta', 'Alquiler'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  onTap: () {
                                    blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.tipoOperacionChanged(value));
                                  },
                                  child: Text(value),
                                );
                              }).toList(),
                            )),
                        _setRoomsInput(blocContext, state),
                        _setBathroomsInput(blocContext, state),
                        //_setPayMethodInput(),
                        Container(
                            padding: const EdgeInsets.all(55.0),
                            child: TextButton(
                              style: TextButton.styleFrom(backgroundColor: Colors.amber),
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  try {
                                    var suggestion = (await PlacesService().getAutocomplete(
                                            '${state.direccion}, ${state.codigoPostal}, ${state.ciudad}'))
                                        .first;
                                    var place = await PlacesService().getPlace(suggestion.placeId);

                                    await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('No'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                var photosRefList = tuListString(photoList);
                                                blocContext.read<CreateBlocBloc>().add(
                                                    CreateBlocEvent.modifImageListChanged(imageList, photosRefList));
                                                blocContext
                                                    .read<CreateBlocBloc>()
                                                    .add(CreateBlocEvent.ubicacionChanged(place));
                                                serviciosAdded.addAll(state.servicios);
                                                blocContext
                                                    .read<CreateBlocBloc>()
                                                    .add(CreateBlocEvent.serviciosChanged(serviciosAdded));
                                                var userData = User();
                                                userData.getPropList().removeWhere(
                                                    (element) => element.inmuebleID == widget.inmueble.inmuebleID);
                                                blocContext
                                                    .read<CreateBlocBloc>()
                                                    .add(CreateBlocEvent.replaceChanges());
                                                Navigator.of(context)
                                                  ..pop()
                                                  ..pop()
                                                  ..pop()
                                                  ..push(MaterialPageRoute(builder: (context) => MyInmueblesView()));
                                              },
                                              child: Text('Si'),
                                            ),
                                          ],
                                          content: Container(
                                            height: MediaQuery.of(context).size.height * 0.45,
                                            child: Column(
                                              children: [
                                                Text(
                                                  '¿Es esta la ubicacion de su inmueble?',
                                                  style: TextStyle(fontSize: 22),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Container(
                                                  height: MediaQuery.of(context).size.height * 0.35,
                                                  child: GoogleMap(
                                                    mapType: MapType.hybrid,
                                                    initialCameraPosition: CameraPosition(
                                                      target: LatLng(
                                                          place.geometry.location.lat, place.geometry.location.lng),
                                                      zoom: 19,
                                                    ),
                                                    markers: {
                                                      Marker(
                                                        markerId: MarkerId('example'),
                                                        position: LatLng(
                                                            place.geometry.location.lat, place.geometry.location.lng),
                                                      )
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } catch (e) {
                                    return Dialogs.materialDialog(
                                        context: context,
                                        title: 'Error: dirección no encontrada',
                                        msg: 'Compruebe que los campos sean correctos',
                                        color: Colors.white,
                                        actions: [
                                          IconsButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            text: 'Aceptar',
                                            iconData: Icons.done,
                                            color: Colors.blue,
                                            textStyle: TextStyle(color: Colors.white),
                                            iconColor: Colors.white,
                                          ),
                                        ]);
                                  }
                                }
                              },
                              child: Text(
                                'Guardar cambios',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: Colors.amber,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return PhotoBottomSheet(
                            onTapCamera: () {
                              getImage(context, ImageSource.camera);
                            },
                            onTapGallery: () {
                              getImage(context, ImageSource.gallery);
                            },
                            image: null,
                          );
                        },
                      );
                    },
                    child: Icon(Icons.camera_alt, color: Colors.white),
                  ));
            }));
  }

  void getImage(BuildContext context, ImageSource source) async {
    var picture = await ImagePicker().getImage(source: source);
    setState(() {
      if (picture != null) imageList.add(File(picture.path));
      photoList = tuListImage(loadedImages, imageList);
      if (loadedImages.isEmpty) {
        setImageView(context);
      }
      ;
    });
    Navigator.of(context).pop();
  }

  Widget setImageView(BuildContext context) {
    if (loadedImages.isNotEmpty || imageList.isNotEmpty) {
      return CarouselSlider(
        items: photoList.map((e) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: FittedBox(fit: BoxFit.scaleDown, child: e.image)),
              IconButton(
                icon: _deleteIcon,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    photoList.remove(e);
                  });
                },
              ),
            ],
          );
        }).toList(),
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.2,
          enableInfiniteScroll: false,
          viewportFraction: 1.0,
          pageSnapping: true,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _setRoomsInput(BuildContext blocContext, CreateBlocState state) {
    if (state.tipoInmueble == 'Vivienda') {
      return Container(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            initialValue: state.nDormitorios == 0 ? null : state.nDormitorios.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: 'Dormitorios',
                labelText: 'DORMITORIOS',
                labelStyle: TextStyle(letterSpacing: 4, fontSize: 12)),
            onChanged: (texto) =>
                blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.nDormitoriosChanged(int.parse(texto))),
            validator: (texto) {
              if (texto!.isEmpty) {
                return 'Número de dormitorios obligatorio';
              }
              return null;
            },
          ));
    } else {
      if (state.tipoInmueble == 'Habitación') {
        blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.nDormitoriosChanged(1));
      } else {
        blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.nDormitoriosChanged(0));
      }
    }
    return Container();
  }

  Widget _setBathroomsInput(BuildContext blocContext, CreateBlocState state) {
    if (state.tipoInmueble == 'Vivienda' || state.tipoInmueble == 'Local' || state.tipoInmueble == 'Habitación') {
      return Container(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            initialValue: state.nBanyos == 0 ? null : state.nBanyos.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: 'Cuartos de baño',
                labelText: 'CUARTOS DE BAÑO',
                labelStyle: TextStyle(letterSpacing: 4, fontSize: 12)),
            onChanged: (texto) {
              blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.nBanyosChanged(int.parse(texto)));
            },
            validator: (texto) {
              if (texto!.isEmpty) {
                return 'Número de baños obligatorio';
              }
              return null;
            },
          ));
    } else {
      blocContext.read<CreateBlocBloc>().add(CreateBlocEvent.nBanyosChanged(0));
    }
    return Container();
  }
}

List<ImageWithURL> tuListImage(List<String> ls, List<File> lf) {
  var li = <ImageWithURL>[];
  ls.forEach((e) => li.add(ImageWithURL(Image(image: Image.network(e).image), e)));
  lf.forEach((e) => li.add(ImageWithURL(Image.file(File(e.path)), '')));
  return li;
}

List<String> tuListString(List<ImageWithURL> li) {
  var ls = <String>[];
  for (var i = 0; i < li.length; i++) {
    if (li[i].url != '') {
      ls.add(li[i].url);
    }
  }
  return ls;
}

class ImageWithURL {
  late Image image;
  late String url;

  ImageWithURL(this.image, this.url);
}
