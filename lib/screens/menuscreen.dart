import 'dart:io';
import 'package:findchest/dialog/app_dailog.dart';
import 'package:findchest/screens/mainscreen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: 320, // You can adjust the size as per your requirement
            height: 320, // You can adjust the size as per your requirement
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      attempt = 4;
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const PlayScreen(),
                        ),
                        ModalRoute.withName('/play'),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text("Play",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ))),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    final showDialog = await showExitDialog(context);
                    if (showDialog) {
                      exit(0);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Exit",
                    style: TextStyle(fontSize: 25),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
