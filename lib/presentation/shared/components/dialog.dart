import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/util/intl/strings.dart';

abstract class CtDialog {
  static void showPlatformSuccessDialog(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text(CtStrings.dialogTitle),
          actions: [
            CupertinoDialogAction(
              child: const Text(CtStrings.okCap),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(CtStrings.dialogTitle),
          actions: [
            TextButton(
              child: const Text(CtStrings.okCap),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }
}
