import 'package:flutter/material.dart';

Future<bool> showWinDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("You WIN"),
          content: const Text("You found the heart ♥"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Next")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("Exit"))
          ],
        );
      }).then((value) => value ?? false);
}

Future<bool> showLoseDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("You Lose"),
          content: const Text("You can do it. Try again?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Yes")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No"))
          ],
        );
      }).then((value) => value ?? false);
}

Future<bool> showExitDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Warning"),
          content: const Text("Are you sure you want to exit?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Yes")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No"))
          ],
        );
      }).then((value) => value ?? false);
}
