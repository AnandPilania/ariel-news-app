import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

abstract class ImageView extends Widget {
//Stack allows to stack things one over the other
  static Widget zoomableImageView(String url, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Zoom(
          backgroundColor: Colors.black,
          width: 1800,
          height: 1800,
          initZoom: 0.001,
          child: InkWell(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
              ),
            ),
          )),
    );
  }
}
