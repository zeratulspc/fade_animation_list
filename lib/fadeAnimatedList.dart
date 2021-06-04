
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
    super.initState();
  }

  List<bool> widgetVisible = [
    false,false,false,false,false,false,false,
    false,false,false,false,false,false,false,
    false,false,false,false,false,false,false,
    false,false,false,false,false,false,false,
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
        itemCount: widgetVisible.length,
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        itemBuilder: (context, index) {
          return AnimatedOpacity(
              opacity: widgetVisible[index] ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: Card(
              child: Container(
                height: Random().nextInt(300)+100.toDouble(),
                child: Center(
                  child: Text("$index"),
                ),
              ),
            ),
          );
        }
    );
  }
}