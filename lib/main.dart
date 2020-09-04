import 'package:acnh_explorer/animal_list_tile.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'acnh_explorer',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AC New Horizons Explorer"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
            iconData: Icons.opacity,
            title: "Fische",
          ),
          TabData(
            iconData: Icons.landscape,
            title: "Insekten",
          ),
          TabData(
            iconData: Icons.pool,
            title: "Meerestiere",
          ),
        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            AnimalListTile(),
          ],
        );
      case 1:
        return ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            AnimalListTile(),
          ],
        );
      case 2:
        return ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            AnimalListTile(),
          ],
        );
    }
  }
}
