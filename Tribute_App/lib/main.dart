import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Card(),
    ));

class Card extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  int testno = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("HOF"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            testno += 1;
          });
        },
        child: Icon(Icons.done),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/jordan.jpg'),
                radius: 60.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
            ),
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Michael Jordan",
                      style: TextStyle(
                        color: Colors.amberAccent[200],
                        letterSpacing: 1.5,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 50.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Position",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "SG/SF",
                      style: TextStyle(
                        color: Colors.amberAccent[200],
                        letterSpacing: 1.5,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "PPG",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "30.1",
                      style: TextStyle(
                        color: Colors.amberAccent[200],
                        letterSpacing: 1.5,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30.0),
                Column(
                  children: <Widget>[
                    Text(
                      "RPG",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "6.2",
                      style: TextStyle(
                        color: Colors.amberAccent[200],
                        letterSpacing: 1.5,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30.0),
                Column(
                  children: <Widget>[
                    Text(
                      "APG",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "5.3",
                      style: TextStyle(
                        color: Colors.amberAccent[200],
                        letterSpacing: 1.5,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 25.0),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "FG%",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "49.7",
                      style: TextStyle(
                        color: Colors.amberAccent[200],
                        letterSpacing: 1.5,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "FG3%",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "32.7",
                      style: TextStyle(
                        color: Colors.amberAccent[200],
                        letterSpacing: 1.5,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "FT%",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "83.5",
                      style: TextStyle(
                        color: Colors.amberAccent[200],
                        letterSpacing: 1.5,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "eFG%",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "50.9",
                      style: TextStyle(
                        color: Colors.amberAccent[200],
                        letterSpacing: 1.5,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.assistant,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  "6x NBA Champion",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  "14x All Star",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.score,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  "10x Scoring Champion",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.looks_5,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  "5x MVP",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.monetization_on,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  "\$89.7 Million in Salary",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.0),
            Text(
              "Honor Count",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "$testno",
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 1.5,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
