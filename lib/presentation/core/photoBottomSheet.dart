import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/presentation/core/heroPhotoViewer.dart';

class PhotoBottomSheet extends StatefulWidget {
  final Function()? onTapCamera;
  final Function()? onTapGallery;
  final String? nameCamera;
  final String? nameGalley;
  final Image? image;

  PhotoBottomSheet({this.onTapCamera, this.onTapGallery, this.nameCamera, this.nameGalley, this.image});

  @override
  _PhotoBottomSheetState createState() => _PhotoBottomSheetState();
}

class _PhotoBottomSheetState extends State<PhotoBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          Container(
            child: widget.image != null
                ? ListTile(
                    title: Container(
                      height: 200.0,
                      width: double.maxFinite,
                      child: Hero(
                        tag: 'previewExpense',
                        child: Container(
                          child: widget.image,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HeroPhotoViewRouteWrapper(
                            image: widget.image,
                            maxScale: PhotoViewComputedScale.contained * 1.8,
                            minScale: PhotoViewComputedScale.contained,
                          ),
                        ),
                      );
                    },
                    contentPadding: EdgeInsets.only(left: 5, right: 5),
                  )
                : Container(),
          ),
          ListTile(
            title: Text(
              widget.nameGalley ?? 'Abrir Galeria',
              textAlign: TextAlign.center,
            ),
            onTap: widget.onTapGallery!,
          ),
          ListTile(
            title: Text(widget.nameCamera ?? 'Abrir Cámara', textAlign: TextAlign.center),
            onTap: widget.onTapCamera!,
          ),
        ],
      ),
    );
  }
}

Future<Image> getImage(ImageSource source) async {
  var userData = User();
  final pickedFile = await ImagePicker().getImage(source: source);

  userData.setFile(File(pickedFile!.path));

  return Image.file(
    userData.getFile()!,
    fit: BoxFit.cover,
  );
}
