import 'package:flutter/material.dart';
import 'package:tic_tac_toe_starter/widgets.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: TicTacToePage(),
  ));
}

class TicTacToePage extends StatefulWidget {
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  Icon empty1, empty2, empty3, empty4, empty5, empty6, empty7, empty8, empty9;
  String str = 'X\'s move';
  Icon cross = Icon(
    Icons.close,
    size: 80,
    color: Color(0xFF3C3F41),
  );
  Icon zero = Icon(
    FontAwesomeIcons.circle,
    size: 70,
    color: Color(0xFF3C3F41),
  );
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ' '));

  int count = 1;

  @override
  Widget build(BuildContext context) {
    Icon getterAndSetter(int r, int c) {
      if (count <= 9) {
        if (count % 2 != 0) {
          if (board[r][c] == ' ') {
            board[r][c] = 'X';
            count += 1;
            str = 'O\'s move';
            return cross;
          } else if (board[r][c] != ' ') {
            str = 'invalid move ';
            return zero;
          }
        } else if (count % 2 == 0) {
          if (board[r][c] == ' ') {
            board[r][c] = 'O';
            count += 1;
            str = 'X\'s move';
            return zero;
          } else if (board[r][c] != ' ') {
            str = 'invalid move';
            return cross;
          }
        }
      } else if (board[r][c] == 'X') {
        return cross;
      } else if (board[r][c] == 'O') return zero;
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: new AssetImage('assets/pin.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tic Tac Toe',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              str,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 25,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                containerSpace(
                  child: empty1,
                  onTap: () {
                    setState(() {
                      empty1 = getterAndSetter(0, 0);
                    });
                  },
                ),
                containerSpace(
                  child: empty2,
                  onTap: () {
                    setState(() {
                      empty2 = getterAndSetter(0, 1);
                    });
                  },
                ),
                containerSpace(
                  child: empty3,
                  onTap: () {
                    setState(() {
                      empty3 = getterAndSetter(0, 2);
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                containerSpace(
                  child: empty4,
                  onTap: () {
                    setState(() {
                      empty4 = getterAndSetter(1, 0);
                    });
                  },
                ),
                containerSpace(
                  child: empty5,
                  onTap: () {
                    setState(() {
                      empty5 = getterAndSetter(1, 1);
                    });
                  },
                ),
                containerSpace(
                  child: empty6,
                  onTap: () {
                    setState(() {
                      empty6 = getterAndSetter(1, 2);
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                containerSpace(
                  child: empty7,
                  onTap: () {
                    setState(() {
                      empty7 = getterAndSetter(2, 0);
                    });
                  },
                ),
                containerSpace(
                  child: empty8,
                  onTap: () {
                    setState(() {
                      empty8 = getterAndSetter(2, 1);
                    });
                  },
                ),
                containerSpace(
                  child: empty9,
                  onTap: () {
                    setState(() {
                      empty9 = getterAndSetter(2, 2);
                    });
                  },
                ),
              ],
            ),
            containerSpace(
              onTap: () {
                setState(() {
                  str = 'X\'s move';
                  count = 1;
                  board = List.generate(3, (_) => List.filled(3, ' '));
                  empty1 = empty2 = empty3 = empty4 =
                      empty5 = empty6 = empty7 = empty8 = empty9 = null;
                });
              },
              child: Center(
                child: Text(
                  'Reset',
                  style: TextStyle(
                      color: Color(0xFF3C3F41), fontSize: 35, letterSpacing: 8),
                ),
              ),
              opacity: .7,
              width: 240,
            ),
          ],
        ),
      ),
    );
  }
}
