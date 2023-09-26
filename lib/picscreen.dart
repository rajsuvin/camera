import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Picview extends StatefulWidget {
   Picview(this.file,{super.key});
   XFile file;

  @override
  State<Picview> createState() => _PicviewState();
}

class _PicviewState extends State<Picview> {
  @override
  Widget build(BuildContext context) {
    File pic = File(widget.file.path);
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: Center(
        child: Image.file(pic),
      ),
    );
  }
}