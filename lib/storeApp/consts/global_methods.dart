import 'package:flutter/material.dart';
import 'package:thecodyapp/chatApp/common/utils/colors.dart';
import 'package:thecodyapp/storeApp/widgets/text_widget.dart';

class GlobalMethods {
  static navigateTo({required BuildContext ctx, required String routeName}) {
    Navigator.pushNamed(ctx, routeName);
  }

  static Future<void> warningDialog({
    required String title,
    required String subtitle,
    required Function fct,
    required BuildContext context,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/warning-sign.png',
                  height: 30,
                  width: 30,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(title),
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                    text: 'Cancel', color: tabLabelColor, textSize: 20),
              ),
              TextButton(
                onPressed: () {
                  fct();
                   if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(text: 'OK', color: tabColor, textSize: 20),
              ),
            ],
          );
        });
  }

  static Future<void> errorDialog({
    required String subtitle,
    required BuildContext context,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/error-sign.png',
                  height: 30,
                  width: 30,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text('An Error Occured'),
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                    text: 'Ok', color: tabLabelColor, textSize: 20),
              ),
            ],
          );
        });
  }
}
