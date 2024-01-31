import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool ohTurn = true;
  List<String> displayExOh = List.filled(9, '');
  int xTurn = 0;
  int oTurn = 0;

  // static var myNewFont = GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.black,letterSpacing: 3));
  // static var myNewFontWhite = GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 15));
  static var myNewFontWhite =  TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                           Text(
                            'Player O',
                            style: myNewFontWhite,
                          ),
                          Text(
                            '$oTurn',
                            style: myNewFontWhite,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                           Text(
                            'Player X',
                            style: myNewFontWhite,
                          ),
                          Text(
                            '$xTurn',
                            style: myNewFontWhite,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _onTap(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white24)),
                      child: Center(
                          child: Text(
                        displayExOh[index],
                        // index.toString(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    ),
                  );
                },
              ),
            ),
             Expanded(
              child: Column(
                children: [
                  Text(
                    'TIC TAC TOE',
                    style: myNewFontWhite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onTap(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        checkFilled();
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        checkFilled();
      }
      ohTurn = !ohTurn;
      _checkWin();
    });
  }

  void _checkWin() {
    // if (displayExOh[0] == displayExOh[1] &&
    //     displayExOh[0] == displayExOh[2] &&
    //     displayExOh[0] != '') {
    //   _winnerDailog();
    // }
    // //second row condditions
    // if (displayExOh[3] == displayExOh[4] &&
    //     displayExOh[3] == displayExOh[5] &&
    //     displayExOh[3] != '') {
    //   _winnerDailog();
    // }
    // //third row condditions
    // if (displayExOh[6] == displayExOh[7] &&
    //     displayExOh[6] == displayExOh[8] &&
    //     displayExOh[6] != '') {
    //   _winnerDailog();
    // }
    // //first Column condditions
    // if (displayExOh[0] == displayExOh[3] &&
    //     displayExOh[0] == displayExOh[6] &&
    //     displayExOh[0] != '') {
    //   _winnerDailog();
    // }
    // //second Column condditions
    // if (displayExOh[1] == displayExOh[4] &&
    //     displayExOh[1] == displayExOh[7] &&
    //     displayExOh[1] != '') {
    //   _winnerDailog();
    // }
    // //second Column conditions
    // if (displayExOh[2] == displayExOh[5] &&
    //     displayExOh[2] == displayExOh[8] &&
    //     displayExOh[2] != '') {
    //   _winnerDailog();
    // }
    // //first daigonal conditions
    // if (displayExOh[0] == displayExOh[4] &&
    //     displayExOh[0] == displayExOh[8] &&
    //     displayExOh[0] != '') {
    //   _winnerDailog();
    // }
    // //second daigonal conditions
    // if (displayExOh[2] == displayExOh[4] &&
    //     displayExOh[2] == displayExOh[6] &&
    //     displayExOh[2] != '') {
    //   _winnerDailog();
    // }

    {
      for (var condtion in [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
      ]) {
        if (displayExOh[condtion[0]] == displayExOh[condtion[1]] &&
            displayExOh[condtion[0]] == displayExOh[condtion[2]] &&
            displayExOh[condtion[0]] != '') {
          _winnerDailog(displayExOh[condtion[0]]);
          checkFilled();
        }
      }
    }
  }

  checkFilled() {
    if (displayExOh.every((element) => element.isNotEmpty)) {
      showDialog(
        barrierDismissible: false,
        useRootNavigator: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Draw'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    playAgain();
                  },
                  child: const Text('Play Again'))
            ],
          );
        },
      );
      // filled =
    }
  }

  void _winnerDailog(String winner) {
    showDialog(
      barrierDismissible: false,
      useRootNavigator: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('You win $winner'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  playAgain();
                },
                child: const Text('Play Again'))
          ],
        );
      },
    );
    if (winner == 'O') {
      oTurn += 1;
    } else if (winner == 'X') {
      xTurn += 1;
    }
  }

  playAgain() {
    setState(() {
      displayExOh = List.filled(9, '');
    });
  }
}
