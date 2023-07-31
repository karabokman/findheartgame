import 'package:findchest/screens/menuscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../button/custombutton.dart';

int attempt = 4;

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final int rows = 5;
  final int columns = 5;

  Future<int> getLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checkValue = prefs.containsKey('Level');
    if (!checkValue) {
      await prefs.setInt('Level', 1);
    }
    var numLevel = prefs.getInt('Level') ?? 1;
    return numLevel;
  }

  List<String> generateRandomChar() {
    // Define the characters to be populated in the grid.
    List<String> characters =
        List.filled(18, 'a') + List.filled(6, 'b') + ['c'];

    // Shuffle the characters list to randomize their order.
    characters.shuffle();

    characters.shuffle();

    characters.shuffle();

    return characters;
  }

  List<CustomButton> _generateButtonsList(List<String> randomChar) {
    List<CustomButton> buttons = [];
    for (int i = 0; i < rows * columns; i++) {
      buttons.add(
        CustomButton(
          hold: randomChar[i],
        ),
      );
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    List<String> randomChar = generateRandomChar();
    List<CustomButton> buttonsList = _generateButtonsList(randomChar);

    return FutureBuilder<int>(
        future: getLevel(),
        builder: (context, AsyncSnapshot<int> numLevel) {
          var level = numLevel.data;
          return Scaffold(
            appBar: AppBar(
              title: Text("Level $level"),
              centerTitle: true,
              // bottom: PreferredSize(
              //   preferredSize: Size(100, 25),
              //   child: Text(
              //     '$attempt lives left',
              //   ),
              // ),// attempt needs to change value when variable value decreases.
            ),
            body: Center(
              child: Container(
                width: 320, // You can adjust the size as per your requirement
                height: 320, // You can adjust the size as per your requirement
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                  ),
                  itemBuilder: (context, index) => buttonsList[index],
                  itemCount: buttonsList.length,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const MenuScreen(),
                  ),
                  ModalRoute.withName('/'),
                );
              },
              child: const Icon(Icons.home),
            ),
          );
        });
  }
}
