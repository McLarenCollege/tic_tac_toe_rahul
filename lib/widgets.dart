import 'package:flutter/material.dart';


String rowToString(List<String> row) {
  return row.map((String val) => ' $val ').join('|');
}

void printBoard(List<List<String>> board) {
  List<String> rows = board.map(rowToString).toList();
  print('   A   B   C ');
  print('1 ${rows[0]}');
  print('  ---+---+---');
  print('2 ${rows[1]}');
  print('  ---+---+---');
  print('3 ${rows[2]}');
}

bool row1(List<List<String>> x) {
  if (x[0][0] == x[0][1] && x[0][1] == x[0][2]&&(x[0][2]=='X'||x[0][2]=='O')) return true;
  else return false;
}

bool row2(List<List<String>> x) {
  if (x[1][0] == x[1][1] && x[1][1] == x[1][2] &&(x[1][2]=='X'||x[1][2]=='O')) return true;
  else return false;
}

bool row3(List<List<String>> x) {
  if (x[2][0] == x[2][1] && x[2][1] == x[2][2]&&(x[2][2]=='X'||x[2][2]=='O')) return true;
  else return false;
}

bool col1(List<List<String>> x) {
  if (x[0][0] == x[1][0] && x[1][0] == x[2][0]&&(x[2][0]=='X'||x[2][0]=='O')) return true;
  else return false;
}

bool col2(List<List<String>> x) {
  if (x[0][1] == x[1][1] && x[1][1] == x[2][1]&&(x[2][1]=='X'||x[2][1]=='O')) return true;
  else return false;
}

bool col3(List<List<String>> x) {
  if (x[0][2] == x[1][2] && x[1][2] == x[2][2]&&(x[2][2]=='X'||x[2][2]=='O')) return true;
  else return false;
}

bool diag1(List<List<String>> x) {
  if (x[0][0] == x[1][1] && x[1][1] == x[2][2]&&(x[2][2]=='X'||x[2][2]=='O')) return true;
  else return false;
}

bool diag2(List<List<String>> x) {
  if (x[0][2] == x[1][1] && x[1][1] == x[2][0]&&(x[2][0]=='X'||x[2][0]=='O')) return true;
  else return false;
}

bool winnerGetter(List<List<String>> x) {
  if ((x[0][0] == x[0][1] && x[0][1] == x[0][2] && x[0][2] == 'X') ||
      (x[1][0] == x[1][1] && x[1][1] == x[1][2] && x[1][2] == 'X') ||
      (x[2][0] == x[2][1] && x[2][1] == x[2][2] && x[2][2] == 'X') ||
      (x[0][0] == x[1][0] && x[1][0] == x[2][0] && x[2][0] == 'X') ||
      (x[0][1] == x[1][1] && x[1][1] == x[2][1] && x[2][1] == 'X') ||
      (x[0][2] == x[1][2] && x[1][2] == x[2][2] && x[2][2] == 'X') ||
      (x[0][0] == x[1][1] && x[1][1] == x[2][2] && x[2][2] == 'X') ||
      (x[0][2] == x[1][1] && x[1][1] == x[2][0] && x[2][0] == 'X')) {
    print('X is winner');
    return true;
  } else if ((x[0][0] == x[0][1] && x[0][1] == x[0][2] && x[0][2] == 'O') ||
      (x[1][0] == x[1][1] && x[1][1] == x[1][2] && x[1][2] == 'O') ||
      (x[2][0] == x[2][1] && x[2][1] == x[2][2] && x[2][2] == 'O') ||
      (x[0][0] == x[1][0] && x[1][0] == x[2][0] && x[2][0] == 'O') ||
      (x[0][1] == x[1][1] && x[1][1] == x[2][1] && x[2][1] == 'O') ||
      (x[0][2] == x[1][2] && x[1][2] == x[2][2] && x[2][2] == 'O') ||
      (x[0][0] == x[1][1] && x[1][1] == x[2][2] && x[2][2] == 'O') ||
      (x[0][2] == x[1][1] && x[1][1] == x[2][0] && x[2][0] == 'O')) {
    print('O is winner');
    return true;
  } else {
    return false;
  }
}

class containerSpace extends StatelessWidget {
  final Function onTap;
  final double height;
  final double width;
  final double opacity;
  final Widget child;
  final Color color;

  containerSpace(
      {this.onTap,
      this.height = 90,
      this.width = 90,
      this.opacity = .5,
      this.child,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(opacity),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: AnimatedOpacity(
          child: child,
          duration: Duration(milliseconds: 500),
          opacity: child == null ? 0.0 : 1.0,
        ),
      ),
    );
  }
}
