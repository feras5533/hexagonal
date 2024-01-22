import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

customDialog({
  required title,
  required context,
  bool error = true,
}) {
  return AnimatedSnackBar(
    builder: (context) {
      return Container(
        height: 50,
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: error ? Colors.grey.shade900 : Colors.green,
        ),
        child: Row(
          children: [
            Icon(
              Icons.error_outline_outlined,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            AutoSizeText(
              title,
              minFontSize: 12,
              maxFontSize: 20,
              style: TextStyle(
                // fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    },
    duration: Duration(seconds: 4),
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    mobilePositionSettings:
        MobilePositionSettings(bottomOnAppearance: 25, bottomOnDissapear: -60),
  ).show(context);
}
