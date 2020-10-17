import 'package:chat_bot/screens/webview.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class UsefulList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text('Useful Links'),
        centerTitle: true,
        backgroundColor: kBcolor,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'ORGANISATIONS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/who.png'),
              ),
              title: Text('WHO Covid'),
              subtitle: Text('World Health Organisation'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "WHO Covid",
                          selectedUrl:
                              "https://www.who.int/emergencies/diseases/novel-coronavirus-2019",
                        )));
              },
              // selected: true,
              dense: true,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/mohfw.png'),
              ),
              title: Text('MOHFW Covid'),
              subtitle: Text('MOHFW homepage'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "MOHFW Homepage",
                          selectedUrl: "https://www.mohfw.gov.in/",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/mygov.png'),
              ),
              title: Text('MyGov'),
              subtitle: Text('MyGov Covid page'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "MyGov Covid",
                          selectedUrl: "https://www.mygov.in/covid-19/",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/cdc.png'),
              ),
              title: Text('CDC'),
              subtitle: Text('Centers for disease control and prevention'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "CDC",
                          selectedUrl:
                              "https://www.cdc.gov/coronavirus/2019-ncov/index.html",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/unicef.png'),
              ),
              title: Text('UNICEF'),
              subtitle: Text('UNICEF Covid'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "UNICEF",
                          selectedUrl:
                              "https://www.unicef.org/coronavirus/covid-19",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'FAQs, Myths and Facts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/myths.png'),
              ),
              title: Text('COVID Myths'),
              subtitle: Text('MyGov page busting covid myths'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "COVID Myths",
                          selectedUrl:
                              "https://transformingindia.mygov.in/covid-19/?sector=myth-busters&type=en#scrolltothis",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/facts.png'),
              ),
              title: Text('COVID Facts'),
              subtitle: Text('MyGov page illustrating covid facts'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "COVID Facts",
                          selectedUrl:
                              "https://transformingindia.mygov.in/covid-19/?sector=fact-check&type=en#scrolltothis",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/cov.png'),
              ),
              title: Text('COVID Q&A'),
              subtitle: Text('WHO with all possible covid queries'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "COVID Q&A",
                          selectedUrl:
                              "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/cov.png'),
              ),
              title: Text('COVID FAQs'),
              subtitle: Text('CDC answering common covid queries'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "COVID FAQs",
                          selectedUrl:
                              "https://www.cdc.gov/coronavirus/2019-ncov/daily-life-coping/share-facts.html",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Dashboards and Statistics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/worldometer.png'),
              ),
              title: Text('WorldOmeters'),
              subtitle: Text('A dashboard depicting worldwide statistics'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "WorldOmeters",
                          selectedUrl:
                              "https://www.worldometers.info/coronavirus/",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/jhu.png'),
              ),
              title: Text('JHU'),
              subtitle:
                  Text('John Hopkins University dashboard and statistics'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "John Hopkins University",
                          selectedUrl: "https://coronavirus.jhu.edu/map.html",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/covidindia.png'),
              ),
              title: Text('CovidIndia'),
              subtitle: Text('A dashboard depicting Indian Statistics'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "Covid India",
                          selectedUrl: "https://covidindia.org/",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/covid19india.png'),
              ),
              title: Text('Covid19India'),
              subtitle:
                  Text('A dashboard depicting case visualizations in INDIA'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "Covid-19-India",
                          selectedUrl: "https://www.covid19india.org/",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'COVID News',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/msd.png'),
              ),
              title: Text('MSD Manuals'),
              subtitle: Text('MSD Manuals page for recent covid news'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "MSD Manuals covid",
                          selectedUrl:
                              "https://www.msdmanuals.com/home/resourcespages/select-covid-19-news",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/thehindu.png'),
              ),
              title: Text('The Hindu'),
              subtitle: Text('The Hindu page for recent covid news'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "The Hindu",
                          selectedUrl:
                              "https://www.thehindu.com/topic/coronavirus/",
                        )));
              },
              //selected: true,
              dense: true,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/bbc.png'),
              ),
              title: Text('BBC News'),
              subtitle: Text('BBC page for worldwide covid news'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "BBC covid News",
                          selectedUrl: "https://www.bbc.com/news/coronavirus",
                        )));
              },
              //selected: true,
              dense: true,
            ),
          ],
        ),
      ),
    );
  }
}
