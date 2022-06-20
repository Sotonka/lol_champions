import 'package:flutter/material.dart';
import 'package:lol_champions/common/app_colors.dart';

Widget LoadingIndicator() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Center(
      child: CircularProgressIndicator(
        color: AppColors.mainAccent,
      ),
    ),
  );
}
