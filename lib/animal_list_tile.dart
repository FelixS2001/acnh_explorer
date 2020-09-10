import 'package:acnh_explorer/animal.dart';
import 'package:flutter/material.dart';

class AnimalListTile extends StatelessWidget {
  final Animal _animal;

  AnimalListTile(this._animal);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 100,
      width: double.maxFinite,
      child: Card(
          elevation: 8,
          shadowColor: Colors.black38,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2, // 20%
                child: Container(
                  child: Image.network(
                    _animal.iconUri,
                  ),
                ),
              ),
              Expanded(
                flex: 6, // 60%
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    _animal.name,
                    style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2, // 20%
                child: Container(
                  child: Text(
                    _animal.price.toString(),
                    style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
