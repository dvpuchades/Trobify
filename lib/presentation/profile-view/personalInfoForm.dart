import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trobify/application/personal_info_bloc/personal_info_bloc_bloc.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:trobify/presentation/core/photoBottomSheet.dart';
import 'package:trobify/presentation/profile-view/profile-view.dart';

class PersonalInfoForm extends StatefulWidget {
  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userData = User();
    return Scaffold(
      body: BlocProvider(
        create: (context) => PersonalInfoBlocBloc(),
        child: Container(
          padding: EdgeInsets.all(16),
          child: BlocConsumer<PersonalInfoBlocBloc, PersonalInfoBlocState>(
            listener: (context, state) {},
            builder: (blocContext, state) {
              return Form(
                key: _formkey,
                child: ListView(
                  children: [
                    Text(
                      'Edita tu información personal',
                      style: TextStyle(fontSize: 32),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      alignment: Alignment.centerRight,
                      child: ClipOval(
                        child: Container(
                          height: MediaQuery.of(blocContext).size.height * 0.15,
                          width: MediaQuery.of(blocContext).size.height * 0.15,
                          child: Material(
                            color: trobifyColor,
                            child: InkWell(
                              splashColor: trobifyColor[1],
                              onTap: () => showModalBottomSheet(
                                  context: blocContext,
                                  builder: (context) {
                                    return PhotoBottomSheet(
                                      onTapCamera: () {
                                        getImage(ImageSource.camera).then(
                                          (value) => blocContext.read<PersonalInfoBlocBloc>().add(
                                                PersonalInfoBlocEvent.photoChanged(value),
                                              ),
                                        );
                                        Navigator.of(context).pop();
                                      },
                                      onTapGallery: () => getImage(ImageSource.gallery).then(
                                        (value) {
                                          blocContext
                                              .read<PersonalInfoBlocBloc>()
                                              .add(PersonalInfoBlocEvent.photoChanged(value));
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      image: state.userImage,
                                    );
                                  }),
                              child: Container(
                                child: state.userImage == null
                                    ? SizedBox(
                                        child: Icon(
                                        Icons.photo,
                                        size: 50,
                                      ))
                                    : SizedBox(
                                        child: state.userImage,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        initialValue: state.email,
                        readOnly: true,
                        enabled: false,
                        decoration: InputDecoration(
                            hintText: 'Introducir correo',
                            labelText: 'CORREO ELECTRONICO',
                            labelStyle: TextStyle(letterSpacing: 4, fontSize: 12)),
                        onChanged: (value) =>
                            blocContext.read<PersonalInfoBlocBloc>().add(PersonalInfoBlocEvent.emailChanged(value)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        initialValue: state.name,
                        decoration: InputDecoration(
                            hintText: 'Introducir nombre',
                            labelText: 'NOMBRE',
                            labelStyle: TextStyle(letterSpacing: 4, fontSize: 12)),
                        onChanged: (value) =>
                            blocContext.read<PersonalInfoBlocBloc>().add(PersonalInfoBlocEvent.nameChanged(value)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        initialValue: state.surname,
                        decoration: InputDecoration(
                            hintText: 'Introducir apellidos',
                            labelText: 'APELLIDOS',
                            labelStyle: TextStyle(letterSpacing: 4, fontSize: 12)),
                        onChanged: (value) =>
                            blocContext.read<PersonalInfoBlocBloc>().add(PersonalInfoBlocEvent.surnameChanged(value)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        initialValue: userData.getPhone(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Introducir telefono',
                            labelText: 'TELEFONO',
                            labelStyle: TextStyle(letterSpacing: 4, fontSize: 12)),
                        onChanged: (value) =>
                            blocContext.read<PersonalInfoBlocBloc>().add(PersonalInfoBlocEvent.phoneChanged(value)),
                        validator: (value) {
                          if (value!.isEmpty || value.length == 9) {
                            state.copyWith(saveChangesVisible: false);
                            return null;
                          }
                          return 'Numero invalido';
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Esta información es necesaria siempre que se desee publicar anuncios o comunicarse con propietarios',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    state.saveChangesVisible
                        ? Container(
                            padding: EdgeInsets.all(14),
                            child: AnimatedButton(
                              text: 'Guardar cambios',
                              color: Colors.blue,
                              pressEvent: () {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    blocContext.read<PersonalInfoBlocBloc>().add(PersonalInfoBlocEvent.submitChanges());
                                  });
                                  AwesomeDialog(
                                      context: context,
                                      animType: AnimType.LEFTSLIDE,
                                      headerAnimationLoop: false,
                                      dialogType: DialogType.SUCCES,
                                      title: 'Éxito',
                                      desc: 'Sus datos han sido cambiado con éxito',
                                      btnOkOnPress: () {
                                        Navigator.of(context).pop();
                                      },
                                      btnOkIcon: Icons.check_circle,
                                      onDissmissCallback: () {
                                        debugPrint('Dialog Dissmiss from callback');
                                      }).show();
                                }
                              },
                            ),
                          )
                        : Container(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
