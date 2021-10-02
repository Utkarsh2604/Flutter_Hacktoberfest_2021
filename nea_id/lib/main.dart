import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: CollegeId(),
    ));

class CollegeId extends StatefulWidget {
  @override
  _CollegeIdState createState() => _CollegeIdState();
}

class _CollegeIdState extends State<CollegeId> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text(
          'ID Card',
          style: TextStyle(
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Some random college, Utopia',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.brown[300],
                letterSpacing: 1.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/smile.jpeg'),
                radius: 40,
              ),
            ),
            Divider(
              height: 20,
              color: Colors.grey,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'NAME',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[100],
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 170),
                Text(
                  'Jane Doe',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.yellow,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'DEPARTMENT',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[100],
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 43),
                Text(
                  'Computer Science \n   and Engineering',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.yellow,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'SEMESTER',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[100],
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 210),
                Text(
                  '3',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.yellow,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'PHONE NO.',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[100],
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 50),
                Text(
                  '+91123456789',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.yellow,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'BLOOD GROUP',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[100],
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 160),
                Text(
                  'O+',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.yellow,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.red[100],
                ),
                SizedBox(width: 80),
                Text(
                  'janedoe69@gmail.com',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'COUNTER',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[100],
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 75),
                Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.yellow,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
