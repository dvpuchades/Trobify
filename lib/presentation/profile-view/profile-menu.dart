import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trobify/application/auth/auth_bloc.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:trobify/presentation/profile-view/create-view.dart';
import 'package:trobify/presentation/profile-view/personalInfoForm.dart';

import 'my-inmuebles-view.dart';

class ProfileMenu extends StatefulWidget {
  @override
  _ProfileMenuState createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    final userData = User();
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Perfil',
              style: Body2TextStyle,
              textScaleFactor: 1.75,
              textAlign: TextAlign.center,
            ),
          ),
          body: Container(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: Colors.grey,
                    width: 4,
                  )),
                ),
                child: ListTile(
                    leading: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.width * 0.15,
                      child: ClipOval(
                        child: userData.getImage() ??
                            Image.asset(
                              'assets/images/media_not_found.jpg',
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.width * 1,
                            ),
                      ),
                    ),
                    title: Text(userData.getEmail()),
                    subtitle: Text('Informacion personal'),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonalInfoForm())).then((_) {
                        setState(() {});
                      });
                    }),
              ),
              Divider(
                height: 5,
                thickness: 0,
                indent: 420,
                endIndent: 0,
              ),
              Card(
                child: ListTile(
                    leading: Icon(Icons.apartment_sharp),
                    title: Text('Mis inmuebles'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyInmueblesView()));
                    }),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.add_business),
                  title: Text('Publica un inmueble'),
                  onTap: () {
                    if (userData.getName() != '' && userData.getSurname() != '' && userData.getPhone() != '') {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CrearInmueble()));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('Debes añadir tu información personal para añadir nuevos inmuebles.'),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              Spacer(),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text(
                  'Cerrar Sesion',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text('¿Desea cerrar sesión?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(AuthEvent.signedOut());
                            Navigator.of(context).pop();
                          },
                          child: Text('Si'),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          )),
        );
      },
      listener: (context, state) {},
    );
  }
}
