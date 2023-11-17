import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_logins_flutter/res/colors.dart';


import '../res/app_images.dart';

class Utils {
  // git commit -m "8/15/23 commit Nouman"
  static void flushBarErrorMessage(
      String message, BuildContext context, Color color, String title) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message.toString(),
          backgroundColor: color,
          flushbarPosition: FlushbarPosition.TOP,
          title: title.toString(),
          titleColor: Colors.white,
          duration: Duration(milliseconds: 1300),
        )..show(context));
  }

  static String k_m_b_generator(num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)} K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)} K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)} M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)} B";
    } else {
      return num.toString();
    }
  }

  static Future<bool> showExitPopup(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit the App?'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0.7),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },

                //return true when click on "Yes"
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greenColor,
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;

    //if showDialouge had returned null, then return false
  }






}
