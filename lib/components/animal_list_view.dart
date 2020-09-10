import 'file:///E:/Projekte/acnh_explorer/lib/models/animal.dart';
import 'file:///E:/Projekte/acnh_explorer/lib/components/animal_list_tile.dart';
import 'package:flutter/material.dart';

class AnimalListView extends StatelessWidget {
  final Future<List<Animal>> _animals;

  AnimalListView(this._animals);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Animal>>(
      future: _animals,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          snapshot.data.sort((a, b) => a.name.compareTo(b.name));
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 36),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) =>
                new AnimalListTile(snapshot.data[index]),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
