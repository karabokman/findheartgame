import 'package:findchest/dialog/app_dailog.dart';
import 'package:findchest/screens/menuscreen.dart';
import 'package:flutter/material.dart';
import 'package:findchest/screens/mainscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

//ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  final String hold;
  String label = '';
  bool isPressed = false;
  bool isWin = false;

  CustomButton({
    super.key,
    required this.hold,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late VoidCallback onPressed;

  onTap() async {
    setState(() {
      if (widget.isPressed == false) {
        if (widget.hold == 'a') {
          widget.label = "O";
        }
        if (widget.hold == 'b') {
          widget.label = "X";
          attempt -= 1;
        }
        if (widget.hold == 'c') {
          widget.label = "♥";
          widget.isWin = true;
        }
      }
      widget.isPressed = true;
    });
    if (widget.isWin) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int numLevel = prefs.getInt('Level') ?? 1;
      numLevel++;
      prefs.setInt('Level', numLevel);

      final showDialog = await showWinDialog(context);
      if (showDialog) {
        attempt = 4;

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const PlayScreen(),
              maintainState: false,
            ),
            ModalRoute.withName('/play'));
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const MenuScreen(),
            ),
            ModalRoute.withName('/'));
      }
    }
    if (attempt <= 0) {
      final showDialog = await showLoseDialog(context);
      if (showDialog) {
        attempt = 4;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const PlayScreen(),
              maintainState: false,
            ),
            ModalRoute.withName('/play'));
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const MenuScreen(),
            ),
            ModalRoute.withName('/'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isPressed ? null : onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        widget.label,
        style: const TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}
