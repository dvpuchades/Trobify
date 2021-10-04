import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class HeroPhotoViewRouteWrapper extends StatefulWidget {
  const HeroPhotoViewRouteWrapper({
    this.image,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  final Image? image;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  _HeroPhotoViewRouteWrapperState createState() => _HeroPhotoViewRouteWrapperState();
}

class _HeroPhotoViewRouteWrapperState extends State<HeroPhotoViewRouteWrapper> {
  late PhotoViewController _controller;
  late double scaleCopy;

  @override
  void initState() {
    super.initState();
    _controller = PhotoViewController()..outputStateStream.listen(listener);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void listener(PhotoViewControllerValue value) {
    setState(() {
      scaleCopy = value.scale!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints.expand(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width),
      child: Draggable<Image>(
        data: widget.image,
        childWhenDragging: Container(
          color: Colors.transparent,
        ),
        onDraggableCanceled: (velocity, offset) {
          if (velocity.pixelsPerSecond.dx > 300 ||
              velocity.pixelsPerSecond.dy > 300 ||
              velocity.pixelsPerSecond.dx < -300 ||
              velocity.pixelsPerSecond.dy < -300) {
            Navigator.of(context).pop();
          }
        },
        feedback: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: PhotoView(
            scaleStateController: PhotoViewScaleStateController(),
            imageProvider: widget.image!.image,
            controller: _controller,
            backgroundDecoration: widget.backgroundDecoration,
            basePosition: Alignment.center,
            minScale: widget.minScale,
            maxScale: widget.maxScale,
            heroAttributes: const PhotoViewHeroAttributes(tag: 'previewExpense'),
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: PhotoView(
            scaleStateController: PhotoViewScaleStateController(),
            imageProvider: widget.image!.image,
            controller: _controller,
            backgroundDecoration: widget.backgroundDecoration,
            basePosition: Alignment.center,
            minScale: widget.minScale,
            maxScale: widget.maxScale,
            heroAttributes: const PhotoViewHeroAttributes(tag: 'previewExpense'),
          ),
        ),
      ),
    );
  }
}
