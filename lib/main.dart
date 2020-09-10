import 'package:acnh_explorer/animal.dart';
import 'package:acnh_explorer/animal_list_view.dart';
import 'package:acnh_explorer/animal_service.dart';
import 'package:acnh_explorer/animal_type.dart';
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
  int _currentPage = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  AnimalService _animalService = new AnimalService();
  Future<Animal> futureFish;

  Future<List<Animal>> _fishFuture;
  Future<List<Animal>> _bugsFuture;
  Future<List<Animal>> _seaFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AC New Horizons Explorer"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(_currentPage),
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
        key: _bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            _currentPage = position;
          });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        if (_fishFuture == null) {
          _fishFuture = _animalService.fetchAnimals(AnimalType.FISH);
        }
        return AnimalListView(_fishFuture);
      case 1:
        if (_bugsFuture == null) {
          _bugsFuture = _animalService.fetchAnimals(AnimalType.BUGS);
        }
        return AnimalListView(_bugsFuture);
      case 2:
        if (_seaFuture == null) {
          _seaFuture = _animalService.fetchAnimals(AnimalType.SEA);
        }
        return AnimalListView(_seaFuture);
    }
  }
}
