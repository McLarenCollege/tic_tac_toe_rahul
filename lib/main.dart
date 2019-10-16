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
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ' '));
  String currentPlayer = 'X';


  String boardStatus() {
    printBoard(board);
    // Draw: play again
    // O's Move
    // X's Move
    // O wins
    // X wins
    if (checkDraw()) {
      return 'Draw: Play Again';
    }
    if (winnerGetter(board)) {
      return '$currentPlayer wins';
    }
    return '$currentPlayer\'s move';
  }

  bool checkDraw() {
    return !winnerGetter(board) && isBoardFull();
  }

  Widget getIcon(int row, int column) {
    if (board[row][column] != ' ') {
      if (board[row][column] == 'X') {
        return Icon(
          Icons.close,
          size: 80,
          color: Color(0xFF3C3F41),
        );
      } else {
        return Icon(
          FontAwesomeIcons.circle,
          size: 70,
          color: Color(0xFF3C3F41),
        );
      }
    }
  }

  bool validMove(int row, int column) {
//    return board[row][column] == ' ' && !winnerGetter(board);

    if (board[row][column] != ' ') {
      return false;
    }
    if (winnerGetter(board)) {
      return false;
    }
    return true;
  }

  Widget createContainer(int row, int column) {
    return ContainerSpace(
      color: Colors.white,
      child: getIcon(row, column),
      onTap: () {
        if (!validMove(row, column)) {
          return;
        }
        setState(() {
          board[row][column] = currentPlayer;
          if (!winnerGetter(board)) {
            currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
          }
        });
      },
    );
  }

  bool isBoardFull() {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        if (board[i][j] == ' ') {
          return false;
        }
      }
    }
    return true;
  }


  @override
  Widget build(BuildContext context) {
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
              boardStatus(),
              style: TextStyle(
                color: Colors.white70,
                fontSize: 25,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                createContainer(0, 0),
                createContainer(0, 1),
                createContainer(0, 2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                createContainer(1, 0),
                createContainer(1, 1),
                createContainer(1, 2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                createContainer(2, 0),
                createContainer(2, 1),
                createContainer(2, 2),
              ],
            ),
            ContainerSpace(
              onTap: () {
                setState(() {
                  board = List.generate(3, (_) => List.filled(3, ' '));
                  currentPlayer = 'X';
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
