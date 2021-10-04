import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trobify/presentation/core/constants.dart';

Future<Uint8List> createPriceMarker(double width, double height, String price) async {
  final pictureRecorder = PictureRecorder();
  final canvas = Canvas(pictureRecorder);
  final paint = Paint()..color = Colors.white;

  canvas.drawPath(
    Path()
      ..moveTo(width * 0.15, height)
      ..lineTo(width * 0.5, height * 1.25)
      ..lineTo(width * 0.85, height * 0.99),
    paint,
  );

  canvas.drawRRect(
    RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(
          width * 0.5,
          height * 0.5,
        ),
        height: height,
        width: width,
      ),
      Radius.circular(30),
    ),
    paint,
  );

  var painter = TextPainter(
    textDirection: TextDirection.ltr,
    //un string de length 4 con escalado/tamaño neutro(1) cabe perfecto
    //partiendo de esto se aumenta o disminuye el tamaño del texto
    //en funcion de que sea mayor o menor que 4
    //haciendo que siempre quede bien dentro del marker
    textScaleFactor: 1 + ((4 - price.length) / 10),
    maxLines: 1,
  );
  painter.text = TextSpan(
    text: price,
    style: TextStyle(fontSize: 40, color: trobifyColor[1], fontWeight: FontWeight.w700),
  );

  painter.layout();
  painter.paint(
      canvas,
      Offset(
        (width * 0.5) - painter.width * 0.5,
        (height * 0.5) - painter.height * 0.5,
      ));

  var img = await pictureRecorder.endRecording().toImage(width.round(), (height * 1.5).round());
  var data = await img.toByteData(format: ImageByteFormat.png);
  return data!.buffer.asUint8List();
}
