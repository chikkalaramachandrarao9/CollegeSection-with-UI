import 'package:flutter/material.dart';
import 'Notification.dart';
import 'Message.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Incircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.0),
        child: AppBar(
          backgroundColor: Colors.white,
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NotificationPage();
                      }));
                    },
                    child: SvgPicture.asset(
                      "assets/images/notifications_none-24px 1.svg",
                      width: 28,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Messages();
                      }));
                    },
                    child: Icon(Icons.send, size: 28, color: Colors.black),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(children: [
                Text(
                  'Friends',
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.expand_more)
              ]),
            ),
            userFollowView(),
            userFollowView(),
            userFollowView(),
            userFollowView(),
            userFollowView(),
            userFollowView(),
            userFollowView(),
            userFollowView(),
          ],
        ),
      ),
    );
  }

  Padding userFollowView() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Pearl R. Avery.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Louis Harvey',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            Text('@coolerlouisharvey',
                style: TextStyle(fontSize: 14, color: Colors.grey))
          ]),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 2,
            ),
            child: Text(
              'Friend',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF0CB5BB),
            ),
          ),
        ]));
  }
}
