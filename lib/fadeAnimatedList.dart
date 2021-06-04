
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class FadeAnimatedList extends StatefulWidget {
  _FadeAnimatedListState createState() => _FadeAnimatedListState();
}

class _FadeAnimatedListState extends State<FadeAnimatedList> {

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  void initState() {
    itemPositionsListener.itemPositions.addListener(() => print(itemPositionsListener.itemPositions.value.last));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
        itemCount: 300,
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.amber,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.symmetric(vertical: 3.0),
            child: Center(
              child: Container(
                color: Colors.pink,
                child: Text("$index"),
              ),
            ),
            height: Random().nextInt(300)+100.toDouble(),
          );
        }
    );
  }
}