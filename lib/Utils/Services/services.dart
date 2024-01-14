import 'package:chatbot/Resources/components/Widgets/dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Services {
  static Future<void> showBottomModel(BuildContext context) async {
    await showModalBottomSheet(
        barrierColor: Colors.white.withOpacity(.2),
        backgroundColor: const Color.fromARGB(255, 37, 36, 36),
        context: context,
        builder: (context) {
          return const Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text('Choose Model')),
                SizedBox(
                  width: 5,
                ),
                Flexible(flex: 2, child: DropdownModel())
              ],
            ),
          );
        });
  }

  static ShowSnakBar(BuildContext context, String msg) async {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: const EdgeInsets.all(20),
      content: Text(msg),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    ));
  }

  static showDialogBox(BuildContext context) async {
    return CupertinoAlertDialog(
      title: const Text('No Internet Connection'),
      content: const Text('Please Check Your Internet Connection'),
      actions: [TextButton(onPressed: () {}, child: const Text('OK'))],
    );
  }
}
