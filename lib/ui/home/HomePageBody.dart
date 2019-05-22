import 'package:flutter/material.dart';
import 'package:bitcoin_cards/ui/home/EventRow.dart';
import 'package:bitcoin_cards/model/Event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageBody extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('cards').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();


          return new Expanded(
            child: new Container(
              color: new Color(0xFF736AB7),
              child: new CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  new SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    sliver: new SliverList(
                      // itemExtent: 154.0,
                      delegate: new SliverChildBuilderDelegate(
                            (context, index) => new EventSummary(Event.fromSnapshot(snapshot.data.documents[index]), index),
                        childCount: snapshot.data.documents.length,

                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

