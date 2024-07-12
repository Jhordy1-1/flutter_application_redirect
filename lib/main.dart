import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter URL Launcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _launchURL('https://flutter.github.io/samples/web/simplistic_editor/'),
              child: Text('App 1: Simplistic Editor'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://flutter.github.io/samples/web/game_template/#/play'),
              child: Text('App 2: Game Template'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://z.flutter.gallery/examples/#/dice'),
              child: Text('App 3: Dice Example'),
            ),
          ],
        ),
      ),
    );
  }
}
