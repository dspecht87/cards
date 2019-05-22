import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String title;
  final String who;
  final String time;
  final String price;
  final String description;
  final String image;
  final String picture;

  final DocumentReference reference;

  const Event(
      {this.id,
      this.title,
      this.who,
      this.time,
      this.price,
      this.description,
      this.image,
      this.picture,
      this.reference
      });

  Event.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['id'] != null),
        assert(map['title'] != null),
        assert(map['who'] != null),
        assert(map['description'] != null),
        assert(map['image'] != null),
        assert(map['picture'] != null),
        assert(map['price'] != null),
        assert(map['time'] != null),
        title = map['title'],
        who = map['who'],
        description = map['description'],
        image = map['image'],
        picture = map['picture'],
        price = map['price'],
        time = map['time'],
        id = map['id'].toString();

  Event.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$title:$who>";
}

List<Event> events = [
  const Event(
      id: "1",
      title: "Begin Working on Bitcoin",
      who: "Satoshi Nakamoto",
      time: "2007",
      price: "-",
      description: "According to legend, Satoshi Nakamoto began working on the Bitcoin concept in 2007. While he is on record as living in Japan, it is speculated that Nakamoto may be a collective pseudonym for more than one person.",
      image: "assets/img/work.png",
      picture:
          "https://www.nasa.gov/sites/default/files/thumbnails/image/pia21723-16.jpg"),
  const Event(
      id: "2",
      title: "Release Bitcoin Whitepaper",
      who: "Satoshi Nakamoto",
      time: "Oktober, 2008",
      price: "-",
      description: "Nakamoto publishes a design paper through a metzdowd.com cryptography mailing list that describes the Bitcoin currency and solves the problem of double spending so as to prevent the currency from being copied.",
      image: "assets/img/paper.png",
      picture:
          "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/images/110411main_Voyager2_280_yshires.jpg"),
  const Event(
      id: "3",
      title: "Release Bitcoin v0.1",
      who: "Satoshi Nakamoto",
      time: "January, 2009",
      price: "-",
      description: "Version 0.1 of Bitcoin is released. Compiled with Microsoft Visual Studio for Windows, it lacks a command line interface and is so complete that it furthers speculation that it was developed by more than one person (or by an academic with little programming experience and a great deal of theoretical know-how). It includes a Bitcoin generation system that would create a total of 21 million Bitcoins through the year 2040.",
      image: "assets/img/code.png",
      picture: "https://farm5.staticflickr.com/4086/5052125139_43c31b7012.jpg"),
  const Event(
      id: "4",
      title: "First Block Mined",
      who: "?",
      time: "January, 2009",
      price: "-",
      description: "Block 0, the genesis block, is established at 18:15:05 GMT.",
      image: "assets/img/mine.png",
      picture:
          "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss042e340851_1.jpg"),
  const Event(
      id: "5",
      title: "First Bitcoin Transaction",
      who: "Satoshi & Hal Finney",
      time: "January, 2009",
      price: "-",
      description: "The first transaction of Bitcoin currency, in block 170, takes place between Satoshi and Hal Finney, a developer and cryptographic activist.",
      image: "assets/img/transaction.png",
      picture:
          "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg"),
];
