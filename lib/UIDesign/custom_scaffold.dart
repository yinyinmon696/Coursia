// ignore_for_file: file_names

import 'package:coursia/UIDesign/appbar_painter.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:flutter/material.dart';

class CusotmScaffold extends StatelessWidget {
  final String? text;
  final Widget? data;

  const CusotmScaffold({super.key, required this.text, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: AppTheme.black,
        //elevation: 0.0,
        title: Text(text!),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: data,
          ),
          CustomPaint(
            painter: AppBarPainter(),
            child: Container(height: 0),
          ),
        ],
      ),
    );
  }
}
