import 'package:flutter/material.dart';
class TicGame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TicGameState();
  }
}

class _TicGameState extends State<TicGame> {

  List<List> _matrix;

  _TicGameState() {
    _initMatrix();
  }

  _initMatrix() {
    _matrix = List<List>(3);
    for (var i = 0; i < _matrix.length; i++) {
      _matrix[i] = List(3);
      for (var j = 0; j < _matrix[i].length; j++) {
        _matrix[i][j] = ' ';
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme:  IconThemeData(
    color: Colors.black, 
  ),
  centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Tic tac toe',style: TextStyle(color:Colors.black,fontFamily:"Product_Sans",fontSize:25),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left:60),
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
            
                children: [
                  _buildElement(0, 0),
                  _buildElement(0, 1),
                  _buildElement(0, 2),
                ],
              ),
              Row(
                
                children: [
                  _buildElement(1, 0),
                  _buildElement(1, 1),
                  _buildElement(1, 2),
                ],
              ),
              Row(

                children: [
                  _buildElement(2, 0),
                  _buildElement(2, 1),
                  _buildElement(2, 2),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  String _lastChar = 'O';

  _buildElement(int i, int j) {
    return GestureDetector(
      onTap: () {
        _changeMatrixField(i, j);

        if (_checkWinner(i, j)) {
          _showDialog(_matrix[i][j]);
        } else {
          if (_checkDraw()) {
            _showDialog(null);
          }
        }
      },
      child: Container(
        width: 90.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.white,
            width: 3.5
          )
        ),
        child: Center(
          child: Text(
            _matrix[i][j],
            style: TextStyle(
              fontSize: 92.0,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

  _changeMatrixField(int i, int j) {
    setState(() {
      if (_matrix[i][j] == ' ') {
        if (_lastChar == 'O')
          _matrix[i][j] = 'X';

        else
          _matrix[i][j] = 'O';

        _lastChar = _matrix[i][j];
      }
    });
  }

  _checkDraw() {
    var draw = true;
    _matrix.forEach((i) {
      i.forEach((j) {
        if (j == ' ')
          draw = false;
      });
    });
    return draw;
  }

  _checkWinner(int x, int y) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    var n = _matrix.length-1;
    var player = _matrix[x][y];

    for (int i = 0; i < _matrix.length; i++) {
      if (_matrix[x][i] == player)
        col++;
      if (_matrix[i][y] == player)
        row++;
      if (_matrix[i][i] == player)
        diag++;
      if (_matrix[i][n-i] == player)
        rdiag++;
    }
    if (row == n+1 || col == n+1 || diag == n+1 || rdiag == n+1) {
      return true;
    }
    return false;
  }

  _showDialog(String winner) {
    String dialogText;
    if (winner == null) {
      dialogText = 'It\'s a draw';
    } else {
      dialogText = 'Player $winner won';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Game over'),
          content: Text(dialogText),
          actions: <Widget>[
            FlatButton(
              child: Text('Reset Game'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _initMatrix();
                });
              },
            )
          ],
        );
      }
    );
  }
}