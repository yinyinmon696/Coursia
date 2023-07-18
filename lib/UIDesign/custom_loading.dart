import 'package:coursia/UIDesign/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitChasingDots(
        color: AppTheme.orange,
        size: 50.0,
      ),
    );
  }
}
