import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yibe_final_ui/pages/Money/summary.dart';

import 'borrow.dart';
import 'lend.dart';

class MoneyMatters extends StatefulWidget {
  final String uid;

  MoneyMatters(this.uid);

  @override
  _MoneyMattersState createState() => _MoneyMattersState();
}

class _MoneyMattersState extends State<MoneyMatters> {
  //List<String> categories = ["Lend", "Summary", "Borrow"];
  //PageController pageController = new PageController();
  //int selectedIndex = 0;
  static Color black = Colors.black;
  Future getPosts() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("users").get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context)),
            centerTitle: true,
            elevation: 0.0,
            title: Text('Money Matters', style: TextStyle(color: black)),
            bottom: TabBar(
              indicatorColor: black,
              labelColor: black,
              tabs: [
                Tab(
                  text: 'Lend',
                ),
                Tab(text: 'Borrow'),
                Tab(text: 'Summary'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Lend(uid: widget.uid),
              Borrow(uid: widget.uid),
              Summary(uid: widget.uid),
            ],
          ),
        ),
      ),
    );
    /* return Scaffold(
        appBar: AppBar(
          title: Text(" "),
        ),
        body: PageView(
          pageSnapping: true,
          children: [
            Lend(widget.uid),
            Summary(),
            Borrow()
          ],
        )
    );*/
  }
}
