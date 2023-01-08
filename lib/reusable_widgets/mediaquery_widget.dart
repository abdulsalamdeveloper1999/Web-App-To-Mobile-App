import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyMediaQuery extends SingleChildRenderObjectWidget {
  final double width;
  final double height;
  // final  devicePixelRatio;

  MyMediaQuery({
    required this.width,
    required this.height,
    // this.devicePixelRatio,
    required Widget child,
  }) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MyMediaQueryRenderObject(
      width: width,
      height: height,
      // devicePixelRatio: devicePixelRatio,
    );
  }
}

class _MyMediaQueryRenderObject extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  _MyMediaQueryRenderObject({
    required this.width,
    required this.height,
    // this.devicePixelRatio,
  });

  final double width;
  final double height;
  // final double devicePixelRatio;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }

  @override
  void performLayout() {
    if (child != null) {
      child?.layout(constraints, parentUsesSize: true);
      size = Size(width, height);
    } else {
      size = Size.zero;
    }
  }
}
