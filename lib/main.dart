import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  final _key = GlobalKey();
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Global Key Demo"),
      ),
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Container(
                color: Colors.green[100],
                child: Foo(_key),
              );
              break;
            case 1:
              return Container(
                color: Colors.red[100],
                child: Text("Blank Page"),
              );
              break;
            case 2:
              return Container(
                color: Colors.red[100],
                child: Foo(_key),
              );
              break;
            default:
              throw "404";
          }
        },
      ),
    );
  }
}

class Foo extends StatefulWidget {
  @override
  _FooState createState() => _FooState();

  Foo(key) : super(key: key);
}

class _FooState extends State<Foo> {
  bool _switchValue = false;
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _switchValue,
          onChanged: (v) {
            setState(() {
              _switchValue = v;
            });
          },
        ),
        Slider(
            value: _sliderValue,
            onChanged: (v) {
              setState(() {
                _sliderValue = v;
              });
            })
      ],
    );
  }
}

/*
class PositionedTiles extends StatefulWidget {
  @override
  _PositionedTilesState createState() => _PositionedTilesState();
}

class _PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    //1.색 박스를 StatelessWidget 으로 만들어 사용
    // StatelessColorfulTile(),
    // StatelessColorfulTile(),
    //2.색 박스를 StatefulWidget 으로 만들어 사용
    // StatefulColorfulTile(key: UniqueKey()),
    // StatefulColorfulTile(key: UniqueKey(),),
    //3.색 박스를 Padding 안에 넣은 StatefulWidget 으로 사용
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: StatefulColorfulTile(key: UniqueKey()),
    // ),
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: StatefulColorfulTile(key: UniqueKey()),
    // ),
    Padding(
      // Place the keys at the *top* of the tree of the items in the collection.
      key: UniqueKey(), 
      padding: const EdgeInsets.all(8.0),
      child: StatefulColorfulTile(),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatefulColorfulTile(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

// class StatelessColorfulTile extends StatelessWidget {
//   Color myColor = UniqueColorGenerator().getColor();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: myColor, child: Padding(padding: EdgeInsets.all(70.0)));
//   }
// }

class StatefulColorfulTile extends StatefulWidget {
  StatefulColorfulTile({Key key}) : super(key: key);

  @override
  _StatefulColorfulTileState createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
  Color myColor;

  @override
  void initState() {
    super.initState();
    myColor = UniqueColorGenerator().getColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: Padding(
        padding: EdgeInsets.all(70.0),
      ),
    );
  }
}

class UniqueColorGenerator {
  Color getColor() {
    List<Color> colors = [
      Colors.black,
      Colors.blue,
      Colors.purple,
      Colors.yellow,
      Colors.green,
      Colors.red
    ];
    Random random = new Random();
    int randomNumber = random.nextInt(6);
    return colors[randomNumber];
  }
}
*/
