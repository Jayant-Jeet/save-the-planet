import 'dart:async';

import 'package:flutter/material.dart';
import 'package:save_the_planet/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Card> cards = getCards();
  _CardState previousClick;
  String click = "";
  @override
  void initState() {
    previousClick = _CardState();
    super.initState();
  }

  void handleClick(_CardState source) {
    try {
      if (previousClick.widget.getIsUncovered()) {
        if (click == 'first click') {
          print('second click');
          click = 'second click';
          source.setState(() {
            source.widget.setIsUncovered(true);
            source.widget.setIsClickable(false);
          });
          Timer(Duration(milliseconds: 1000), () {
            if (source.widget.getImagePath() ==
                previousClick.widget.getImagePath()) {
              previousClick = _CardState();
            } else {
              source.setState(() {
                source.widget.setIsUncovered(false);
                source.widget.setIsClickable(true);
              });
              previousClick.setState(() {
                previousClick.widget.setIsUncovered(false);
                previousClick.widget.setIsClickable(true);
              });
              previousClick = _CardState();
            }
          });
        }
      }
    } catch (e) {
      print('first click');
      click = 'first click';
      source.setState(() {
        source.widget.setIsUncovered(true);
        source.widget.setIsClickable(false);
      });
      previousClick = source;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100.0, mainAxisSpacing: 0.0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: List.generate(
            cards.length,
            (index) {
              cards[index].setIsUncovered(true);
              cards[index].setIsClickable(false);
              cards[index].setIndex(index);
              cards[index].setParent(this);
              return cards[index];
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Card extends StatefulWidget {
  String imagePath;
  bool isClickable;
  bool isUncovered;
  int index;
  _MyHomePageState parent;

  Card previousSelection;

  Card(
      {Key key,
      this.imagePath,
      this.isClickable,
      this.isUncovered,
      this.index,
      this.parent})
      : super(key: key);

  void setImagePath(String path) {
    this.imagePath = path;
  }

  void setIsClickable(bool val) {
    this.isClickable = val;
  }

  void setIsUncovered(bool val) {
    this.isUncovered = val;
  }

  void setIndex(int val) {
    this.index = val;
  }

  void setParent(_MyHomePageState val) {
    this.parent = val;
  }

  String getImagePath() {
    return this.imagePath;
  }

  bool getIsClickable() {
    return this.isClickable;
  }

  bool getIsUncovered() {
    return this.isUncovered;
  }

  int getIndex() {
    return this.index;
  }

  _MyHomePageState getParent() {
    return this.parent;
  }

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        setState(() {
          widget.setIsUncovered(false);
          widget.setIsClickable(true);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isClickable) {
          print('clicked ' + widget.index.toString());
          widget.parent.handleClick(this);
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Container(
          child: Image.asset(
              widget.isUncovered ? widget.imagePath : 'assets/default1.png'),
        ),
      ),
    );
  }
}
