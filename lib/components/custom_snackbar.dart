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
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          color: error ? Colors.grey.shade900 : Colors.green,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.error_outline_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            AutoSizeText(
              title,
              minFontSize: 10,
              maxFontSize: 13,
              style: const TextStyle(
                // fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    },
    duration: const Duration(seconds: 4),
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    mobilePositionSettings: const MobilePositionSettings(
        bottomOnAppearance: 25, bottomOnDissapear: -60),
  ).show(context);
}
