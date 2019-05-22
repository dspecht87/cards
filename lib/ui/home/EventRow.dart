import 'package:flutter/material.dart';
import 'package:bitcoin_cards/model/Event.dart';
import 'package:bitcoin_cards/ui/detail/detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventSummary extends StatelessWidget {
  final Event event;
  final int index;
  final bool horizontal;

  EventSummary(this.event, this.index, {this.horizontal = true});

  EventSummary.vertical(
    this.event,
    this.index,
  ) : horizontal = false;

  @override
  Widget build(BuildContext context) {

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');

    final headerTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffffffff),
        fontSize: 18.0,
        fontWeight: FontWeight.w600);

    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);

    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);

    final eventThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "event-hero-${event.id}",
        child: new Image(
          image: new AssetImage(event.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    Widget _eventValue({String value, String image}) {
      return new Row(children: <Widget>[
        new Image.asset(image, height: 12.0),
        new Container(width: 8.0),
        new Text(value, style: regularTextStyle),
      ]);
    }

    final eventCardContent = new Container(
      // constraints: new BoxConstraints.expand(),
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            event.title,
            style: headerTextStyle,
          ),
          new Container(height: 10.0),
          new Text(event.who, style: subHeaderTextStyle),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _eventValue(
                      value: event.time, image: 'assets/img/ic_distance.png')),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _eventValue(
                      value: event.price, image: 'assets/img/ic_gravity.png'))
            ],
          ),
        ],
      ),
    );

    final eventCard = new Container(
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      // height: 150.0,
      decoration: new BoxDecoration(
        color: new Color(0xFF444477),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
      child: eventCardContent,
    );

    return new GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
                new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new DetailPage(event),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          new FadeTransition(opacity: animation, child: child),
                ),
              )
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            eventCard,
            eventThumbnail,
          ],
        ),
      ),
    );
  }
}
