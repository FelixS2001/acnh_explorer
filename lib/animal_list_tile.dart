import 'package:flutter/material.dart';

class AnimalListTile extends StatelessWidget {
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
                    'https://acnhapi.com/v1/icons/fish/1',
                  ),
                ),
              ),
              Expanded(
                flex: 6, // 60%
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Bitterling',
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
                    '90000',
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
