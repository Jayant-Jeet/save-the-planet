import 'dart:async';

import 'package:flutter/material.dart';
import 'package:save_the_planet/card_model.dart';
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
  List<CardModel> cards = getCards();

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        for (CardModel card in cards) {
          card.setIsUncovered(false);
          card.setIsClickable(true);
        }
        setState(() {});
      },
    );
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
              //print(index.toString()+'\t'+(cards[index].getImagePath()));
              return Card(
                imagePath: cards[index].getImagePath(),
                isClickable: cards[index].getIsClickable(),
                isUncovered: cards[index].getIsUncovered(),
                index: index,
                parent: this,
              );
            },
          ),
        ),
      ),
    );
  }
}

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
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  void initState() {
    super.initState();
  }

  int countUncoveredCards() {
    int count = 0;
    for (CardModel card in widget.parent.cards) {
      if (card.getIsUncovered()) {
        count++;
        break;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    print('card '+widget.index.toString());
    print('clickable : '+widget.isClickable.toString());
    print('uncovered : '+widget.isUncovered.toString());
    print(widget.imagePath);
    print('\n');
    return GestureDetector(
      onTap: () {
        if (widget.isClickable) {
          print('clicked me');
          if (countUncoveredCards() == 0) {
            print('first tile');
            print(widget.index);
            widget.parent.setState(() {
              widget.parent.cards[widget.index].setIsUncovered(true);
              widget.parent.cards[widget.index].setIsClickable(false);
            });
            /*setState(() {
              widget.isUncovered = true;
              widget.isClickable = false;
            });*/
            setState(() {
              widget.previousSelection = widget;
            });
          } else {
            print('second tile');
            if (widget.imagePath == widget.previousSelection.imagePath) {
              print('correct');
              widget.parent.setState(() {
              widget.parent.cards[widget.index].setIsUncovered(true);
              widget.parent.cards[widget.index].setIsClickable(false);
            });
              setState(() {
                widget.isUncovered = true;
                widget.isClickable = false;
                widget.previousSelection = Card();
              });
            } else {
              print('wrong');
              setState(() {
                widget.isUncovered = true;
              });
              Timer(
                Duration(seconds: 2),
                () {
                  for (var card in widget.parent.cards) {
                    if (card.getImagePath() == widget.imagePath) {
                      card.setIsClickable(true);
                      card.setIsUncovered(false);
                    }
                  }

                  widget.parent.setState(() {});
                  setState(() {
                    widget.previousSelection = Card();
                  });
                },
              );
            }
          }
          /*setState(() {
            widget.isUncovered = true;
          });*/
          print(widget.imagePath);
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
