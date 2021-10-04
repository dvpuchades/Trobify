import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:trobify/application/map-view-bloc/map_view_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trobify/application/filtros-bloc/filtros_bloc.dart';

class FiltersView extends StatefulWidget {
  final BuildContext mapblocContext;
  final BuildContext mapContext;
  const FiltersView({Key? key, required this.mapblocContext, required this.mapContext}) : super(key: key);
  @override
  _FiltersViewState createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();

  final _minSuperficieController = TextEditingController();
  final _maxSuperficieController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final List<String> _tipoInmuebleFilterOptions = [
    'Vivienda',
    'Trastero',
    'Parcela',
    'Habitación',
    'Local',
    'Garaje',
  ];
  final List<String> _tipoOperacionFilterOptions = ['Alquiler', 'Venta'];
  final List<String> _dormitorioFilterOptions = ['0', '1', '2', '3', '4', '5+'];
  final List<String> _nBanyosFilterOptions = ['0', '1', '2', '3', '4+'];
  final _dateFormat = DateFormat('dd/MM/yyyy');
  final _filtroMinPrecioFormKey = GlobalKey<FormState>();
  final _filtroMaxPrecioFormKey = GlobalKey<FormState>();
  final _filtroMinSuperficieFormKey = GlobalKey<FormState>();
  final _filtroMaxSuperficieFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _maxPriceController.addListener(() {
      var text = _maxPriceController.text;
      _maxPriceController.value = _maxPriceController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });

    _minPriceController.addListener(() {
      final text = _minPriceController.text;
      _minPriceController.value = _minPriceController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });

    _minSuperficieController.addListener(() {
      final text = _minSuperficieController.text;
      _minSuperficieController.value = _minSuperficieController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });

    _maxSuperficieController.addListener(() {
      final text = _maxSuperficieController.text;
      _maxSuperficieController.value = _maxSuperficieController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });

    return BlocBuilder<FiltrosBloc, FiltrosState>(
      builder: (filtrosblocContext, filtrosblocState) {
        _minPriceController.text = filtrosblocState.minValuePrice;
        _maxPriceController.text = filtrosblocState.maxValuePrice;
        _minSuperficieController.text = filtrosblocState.minValueSuperficie;
        _maxSuperficieController.text = filtrosblocState.maxValueSuperficie;
        return WillPopScope(
          onWillPop: () async {
            if (_filtroMinPrecioFormKey.currentState!.validate() &&
                _filtroMaxPrecioFormKey.currentState!.validate() &&
                _filtroMinSuperficieFormKey.currentState!.validate() &&
                _filtroMaxSuperficieFormKey.currentState!.validate()) {
              widget.mapblocContext
                  .read<MapViewBloc>()
                  .add(MapViewEvent.refreshItems(widget.mapContext, filtrosblocState));
              return true;
            } else {
              return false;
            }
          },
          child: Container(
              child: ListView(
            children: [
              ListTile(
                  contentPadding: EdgeInsets.only(left: 32, right: 16),
                  leading: Text(
                    'Filtros',
                    style: TextStyle(fontSize: 25),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        if (_filtroMinPrecioFormKey.currentState!.validate() &&
                            _filtroMaxPrecioFormKey.currentState!.validate() &&
                            _filtroMinSuperficieFormKey.currentState!.validate() &&
                            _filtroMaxSuperficieFormKey.currentState!.validate()) {
                          widget.mapblocContext
                              .read<MapViewBloc>()
                              .add(MapViewEvent.refreshItems(widget.mapContext, filtrosblocState));
                          Navigator.of(context).pop();
                        }
                      })),
              Divider(
                color: trobifyColor[3],
              ),
              ListTile(
                leading: leadingMaker(Icon(Icons.assignment_outlined), '   Tipo\nOperación', 12),
                title: ChipsChoice<String>.multiple(
                  value: filtrosblocState.tipoOperacionFilterTags,
                  onChanged: (value) =>
                      filtrosblocContext.read<FiltrosBloc>().add(FiltrosEvent.tipoOperacionFilterTagsChanged(value)),
                  choiceItems: C2Choice.listFrom<String, String>(
                    source: _tipoOperacionFilterOptions,
                    value: (i, v) => v,
                    label: (i, v) => v,
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      filtrosblocContext
                          .read<FiltrosBloc>()
                          .add(FiltrosEvent.tipoOperacionFilterTagsChanged(_tipoOperacionFilterOptions));
                    }),
              ),
              divisor,
              ListTile(
                leading: leadingMaker(Icon(Icons.euro_symbol_rounded), 'Precio\n   (€)', 14),
                title: Row(
                  children: [
                    VerticalDivider(
                      width: MediaQuery.of(context).size.width / 20,
                      thickness: 0,
                    ),
                    Expanded(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _filtroMinPrecioFormKey,
                        child: TextFormField(
                          controller: _minPriceController,
                          decoration: InputDecoration(
                            errorMaxLines: 3,
                            hintText: 'Mínimo',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.bottom,
                          onChanged: (String newMinValue) {
                            if (_filtroMinPrecioFormKey.currentState!.validate()) {
                              filtrosblocContext
                                  .read<FiltrosBloc>()
                                  .add(FiltrosEvent.minValuePriceChanged(newMinValue));
                            }
                          },
                          validator: (String? newMinValue) {
                            if (newMinValue == null || (newMinValue != '' && int.tryParse(newMinValue) == null)) {
                              return 'Necesito un entero';
                            }
                            if (newMinValue != '' && int.parse(newMinValue) < 0) {
                              return 'No puedo ser menor que 0';
                            }
                            if (filtrosblocState.maxValuePrice != '' &&
                                (newMinValue != '' &&
                                    int.parse(newMinValue) > int.parse(filtrosblocState.maxValuePrice))) {
                              return 'error: Mínimo > Máximo';
                            }
                          },
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: MediaQuery.of(context).size.height / 24,
                      thickness: 0,
                    ),
                    Expanded(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _filtroMaxPrecioFormKey,
                        child: TextFormField(
                          controller: _maxPriceController,
                          decoration: InputDecoration(
                            errorMaxLines: 3,
                            hintText: 'Máximo',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.bottom,
                          onChanged: (String newMaxValue) {
                            if (_filtroMaxPrecioFormKey.currentState!.validate()) {
                              filtrosblocContext
                                  .read<FiltrosBloc>()
                                  .add(FiltrosEvent.maxValuePriceChanged(newMaxValue));
                            }
                          },
                          validator: (String? newMaxValue) {
                            if (newMaxValue == null || (newMaxValue != '' && int.tryParse(newMaxValue) == null)) {
                              return 'Necesito un entero';
                            }
                            if (newMaxValue != '' && int.parse(newMaxValue) < 0) {
                              return 'No puedo ser menor que 0';
                            }
                            if (filtrosblocState.minValuePrice != '' &&
                                (newMaxValue != '' &&
                                    int.parse(newMaxValue) < int.parse(filtrosblocState.minValuePrice))) {
                              return 'error: Máximo < Mínimo';
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      filtrosblocContext.read<FiltrosBloc>().add(FiltrosEvent.maxValuePriceChanged(''));
                      filtrosblocContext.read<FiltrosBloc>().add(FiltrosEvent.minValuePriceChanged(''));
                      setState(() => _minPriceController.clear());
                      setState(() => _maxPriceController.clear());
                    }),
              ),
              divisor,
              ListTile(
                leading: leadingMaker(Icon(Icons.king_bed), 'Dormitorios', 10),
                title: ChipsChoice<String>.multiple(
                  value: filtrosblocState.dormitorioFilterTags,
                  onChanged: (value) =>
                      filtrosblocContext.read<FiltrosBloc>().add(FiltrosEvent.dormitorioFilterTagsChanged(value)),
                  choiceItems: C2Choice.listFrom<String, String>(
                    source: _dormitorioFilterOptions,
                    value: (i, v) => v,
                    label: (i, v) => v,
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      filtrosblocContext
                          .read<FiltrosBloc>()
                          .add(FiltrosEvent.dormitorioFilterTagsChanged(_dormitorioFilterOptions));
                    }),
              ),
              divisor,
              ListTile(
                leading: leadingMaker(Icon(Icons.bathtub), 'Baños', 14),
                title: ChipsChoice<String>.multiple(
                  value: filtrosblocState.nBanyosFilterTags,
                  onChanged: (value) =>
                      filtrosblocContext.read<FiltrosBloc>().add(FiltrosEvent.nBanyosFilterTagsChanged(value)),
                  choiceItems: C2Choice.listFrom<String, String>(
                    source: _nBanyosFilterOptions,
                    value: (i, v) => v,
                    label: (i, v) => v,
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      filtrosblocContext
                          .read<FiltrosBloc>()
                          .add(FiltrosEvent.nBanyosFilterTagsChanged(_nBanyosFilterOptions));
                    }),
              ),
              divisor,
              ListTile(
                leading: leadingMaker(Icon(Icons.apartment), 'Superfície\n     (m2)', 11),
                title: Row(
                  children: [
                    VerticalDivider(
                      width: MediaQuery.of(context).size.width / 20,
                      thickness: 0,
                    ),
                    Expanded(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _filtroMinSuperficieFormKey,
                        child: TextFormField(
                          controller: _minSuperficieController,
                          decoration: InputDecoration(
                            errorMaxLines: 3,
                            hintText: 'Mínimo',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.bottom,
                          onChanged: (String newMinValue) {
                            if (_filtroMinSuperficieFormKey.currentState!.validate()) {
                              filtrosblocContext
                                  .read<FiltrosBloc>()
                                  .add(FiltrosEvent.minValueSuperficieChanged(newMinValue));
                            }
                          },
                          validator: (String? newMinValue) {
                            if (newMinValue == null || (newMinValue != '' && int.tryParse(newMinValue) == null)) {
                              return 'Necesito un entero';
                            }
                            if (newMinValue != '' && int.parse(newMinValue) < 0) {
                              return 'No puedo ser menor que 0';
                            }
                            if (filtrosblocState.maxValueSuperficie != '' &&
                                (newMinValue != '' &&
                                    int.parse(newMinValue) > int.parse(filtrosblocState.maxValueSuperficie))) {
                              return 'error: Mínimo > Máximo';
                            }
                          },
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: MediaQuery.of(context).size.height / 24,
                      thickness: 0,
                    ),
                    Expanded(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _filtroMaxSuperficieFormKey,
                        child: TextFormField(
                          controller: _maxSuperficieController,
                          decoration: InputDecoration(
                            errorMaxLines: 3,
                            hintText: 'Máximo',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.bottom,
                          onChanged: (String newMaxValue) {
                            if (_filtroMaxSuperficieFormKey.currentState!.validate()) {
                              filtrosblocContext
                                  .read<FiltrosBloc>()
                                  .add(FiltrosEvent.maxValueSuperficieChanged(newMaxValue));
                            }
                          },
                          validator: (String? newMaxValue) {
                            if (newMaxValue == null || (newMaxValue != '' && int.tryParse(newMaxValue) == null)) {
                              return 'Necesito un entero';
                            }
                            if (newMaxValue != '' && int.parse(newMaxValue) < 0) {
                              return 'No puedo ser menor que 0';
                            }
                            if (filtrosblocState.minValueSuperficie != '' &&
                                (newMaxValue != '' &&
                                    int.parse(newMaxValue) < int.parse(filtrosblocState.minValueSuperficie))) {
                              return 'error: Máximo < Mínimo';
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      filtrosblocContext.read<FiltrosBloc>().add(FiltrosEvent.maxValueSuperficieChanged(''));
                      filtrosblocContext.read<FiltrosBloc>().add(FiltrosEvent.minValueSuperficieChanged(''));
                      setState(() => _minSuperficieController.clear());
                      setState(() => _maxSuperficieController.clear());
                    }),
              ),
              divisor,
              ListTile(
                leading: leadingMaker(Icon(Icons.house), '   Tipo\nInmueble', 12),
                title: ChipsChoice<String>.multiple(
                  value: filtrosblocState.tipoInmuebleFilterTags,
                  onChanged: (value) =>
                      filtrosblocContext.read<FiltrosBloc>().add(FiltrosEvent.tipoInmuebleFilterTagsChanged(value)),
                  choiceItems: C2Choice.listFrom<String, String>(
                    source: _tipoInmuebleFilterOptions,
                    value: (i, v) => v,
                    label: (i, v) => v,
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      filtrosblocContext
                          .read<FiltrosBloc>()
                          .add(FiltrosEvent.tipoInmuebleFilterTagsChanged(_tipoInmuebleFilterOptions));
                    }),
              ),
              divisor,
              ListTile(
                leading: leadingMaker(Icon(Icons.date_range), 'Fecha', 14),
                title: DateTimeField(
                  initialValue: filtrosblocState.chosenDate == DateTime(1900) ? null : filtrosblocState.chosenDate,
                  format: _dateFormat,
                  decoration: InputDecoration(
                    helperText: 'Añada fecha disponibilidad',
                    prefixText: 'A partir del ',
                    fillColor: trobifyColor[1],
                    focusColor: trobifyColor[1],
                    hoverColor: trobifyColor[1],
                  ),
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        initialDate: filtrosblocState.chosenDate == DateTime(1900)
                            ? DateTime.now()
                            : filtrosblocState.chosenDate,
                        lastDate: DateTime(2080),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: trobifyColor[1]!, // header background color
                                onPrimary: trobifyColor[3]!, // header text color
                                onSurface: Colors.black, // body text color
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary: trobifyColor[3]!, // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        });
                  },
                  cursorColor: trobifyColor[1],
                  onChanged: (DateTime? date) {
                    date ??= DateTime(1900);
                    filtrosblocContext.read<FiltrosBloc>().add(FiltrosEvent.chosenDateChanged(date));
                    setState(() {
                      _dateController.text = _dateFormat.format(date!);
                    });
                  },
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}

Widget divisor = Divider(
  height: 20,
  thickness: 1,
  indent: 75,
  endIndent: 0,
);

Widget leadingMaker(Icon icono, String label, double size) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      icono,
      Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: size,
        ),
      ),
    ],
  );
}
