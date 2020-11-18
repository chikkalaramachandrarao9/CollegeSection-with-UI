import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Comments.dart';
import 'Message.dart';
import 'Notification.dart';

double screenWidth;
double screenHeight;
bool isliked1 = false, isliked2 = false, isliked3 = false;

class Home extends StatefulWidget {
  static final routeName = "/Home";
  final Function hiberPopUp;
  final bool all, friends, closeFriends, aqua, tranding;
  Home(
      {this.hiberPopUp,
      this.all,
      this.aqua,
      this.closeFriends,
      this.friends,
      this.tranding});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> temp = [];
  List<Map> _allList = [];
  List<Map> _friendsList = [];
  List<Map> _closeList = [];
  List<Map> _aquaList = [];
  List<Map> _trendingList = [];

  @override
  void initState() {
    print("init");

    if (widget.all == null) {
      temp.add(_allUsers[0]);
      temp.add(_allUsers[1]);
      temp.add(_allUsers[2]);
      temp.add(_allUsers[3]);
    } else {
      _allList.add(_allUsers[0]);
      _allList.add(_allUsers[1]);
      _allList.add(_allUsers[2]);
      _allList.add(_allUsers[3]);

      _friendsList.add(_allUsers[0]);
      _friendsList.add(_allUsers[2]);
      _friendsList.add(_allUsers[4]);

      _closeList.add(_allUsers[1]);
      _closeList.add(_allUsers[4]);
      _closeList.add(_allUsers[5]);
      _closeList.add(_allUsers[3]);

      _trendingList.add(_allUsers[5]);

      _aquaList.add(_allUsers[3]);
      if (widget.all) {
        temp = _allList;
      } else {
        if (widget.friends) {
          print("Friends");
          temp = temp + _friendsList;
        }
        if (widget.closeFriends) {
          temp = temp + _closeList;
        }
        if (widget.aqua) {
          temp = temp + _aquaList;
        }
        if (widget.tranding) {
          temp = temp + _trendingList;
        }
      }
    }

    if (temp.length == 0) {
      temp.add(_allUsers[0]);
      temp.add(_allUsers[1]);
      temp.add(_allUsers[2]);
      temp.add(_allUsers[3]);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    temp = [];
    print("build");
    if (widget.all == null) {
      temp.add(_allUsers[0]);
      temp.add(_allUsers[1]);
      temp.add(_allUsers[2]);
      temp.add(_allUsers[3]);
    } else {
      _allList = [];
      _friendsList = [];
      _closeList = [];
      _aquaList = [];
      _trendingList = [];

      _allList.add(_allUsers[0]);
      _allList.add(_allUsers[1]);
      _allList.add(_allUsers[2]);
      _allList.add(_allUsers[3]);

      _friendsList.add(_allUsers[5]);
      _friendsList.add(_allUsers[2]);
      _friendsList.add(_allUsers[4]);

      _closeList.add(_allUsers[1]);
      _closeList.add(_allUsers[4]);
      _closeList.add(_allUsers[5]);
      _closeList.add(_allUsers[3]);

      _trendingList.add(_allUsers[5]);

      _aquaList.add(_allUsers[3]);
      if (widget.all) {
        temp = _allList;
        print("all");
      } else {
        temp.clear();
        if (widget.friends) {
          print("Friends");
          temp = temp + _friendsList;
        }
        if (widget.closeFriends) {
          print("_closeList");

          temp = temp + _closeList;
        }
        if (widget.aqua) {
          print("_aquaList");

          temp = temp + _aquaList;
        }
        if (widget.tranding) {
          print("_trendingList");

          temp = temp + _trendingList;
        }
      }
    }

    if (temp.length == 0) temp = _allUsers;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0) {
        } else if (details.delta.dx < 0) {
          print("Left Swap");
        }
      },
      child: Scaffold(
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
                      onLongPress: () {
                        widget.hiberPopUp(true);
                      },
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
        body: ListView.builder(
          itemCount: temp.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return PostTile(
              likeCount: temp[index]['msg'],
              user: temp[index],
            );
          },
        ),
      ),
    );
  }
}

class PostTile extends StatefulWidget {
  final String likeCount;

  var user;
  PostTile({this.likeCount, this.user});
  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.user["image"]),
        ),
        title: Text(
          widget.user["name"],
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: Text(
          widget.user["time"],
          style: TextStyle(
            color: Color(0xFfA7A7A7),
            fontSize: 14.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(Icons.more_vert),
      ),
      widget.user["type"] == "image"
          ? Container(
              width: screenWidth,
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.user["postImage"]),
                  fit: BoxFit.cover,
                ),
              ),
            )
          : widget.user["type"] == "text"
              ? Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                  child: Container(child: Text(widget.user["post text"])))
              : GestureDetector(
                  onTap: () {
                    print("hi");
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                          child: Container(child: Text(widget.user["msg"]))),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: screenWidth,
                        height: 300.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.user["postImage"]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ],
                  ),
                ),
      SizedBox(height: screenHeight * 0.015),
      Container(
        width: screenWidth,
        child: Row(
          children: [
            SizedBox(width: 15.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (isliked1) {
                    isliked1 = false;
                  } else {
                    isliked1 = true;
                  }
                });
              },
              child: isliked1
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30.0,
                    )
                  : Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                      size: 30.0,
                    ),
            ),
            SizedBox(width: 5.0),
            Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  widget.user["like"] + " Yibed",
                  style: TextStyle(fontSize: 12),
                )),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Comments();
                }));
              },
              child:
                  SvgPicture.asset('assets/images/message_icon_homePage.svg'),
            ),
            SizedBox(width: 15.0),
            SizedBox(width: 15.0),
            SvgPicture.asset('assets/images/share_logo.svg'),
            SizedBox(width: 15.0),
          ],
        ),
      ),
      SizedBox(height: 15.0),
      widget.user["type"] == "embedded"
          ? Container()
          : Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
              child: Container(child: Text(widget.user["msg"]))),
      SizedBox(height: 15.0),
      Divider(
        thickness: 1.0,
      ),
    ]);
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

List<Map> _allUsers = [
  {
    "image": "assets/images/Rajani Suryavanshi.png",
    "postImage": "assets/images/post1.png",
    "like": "5.6k",
    "name": "Rajani Suryavanshi",
    "type": "image",
    "time": "1hr ago · California",
    "msg": "What’s the update on the current design?",
  },
  {
    "image": "assets/images/Nicky Mehra.png",
    "like": "15k",
    "post text": "Hi everyone!",
    "name": "Nicky Mehra",
    "type": "text",
    "time": "1hr ago · Malebo",
    "msg": "Excited for the match!"
  },
  {
    "image": "assets/images/Shristi Jalan.png",
    "postImage": "assets/images/post3.png",
    "name": "Shristi Jalan",
    "type": "image",
    "like": "25k",
    "time": "33min ago",
    "msg": "Are you joining activity saturday night ?"
  },
  {
    "image": "assets/images/Pearl R. Avery.png",
    "postImage": "assets/images/post4.png",
    "name": "Pearl R. Avery",
    "like": "5k",
    "type": "embedded",
    "time": "1hr ago · Virkshire",
    "msg": "I don't know anything about this :("
  },
  {
    "image": "assets/images/Akshar Luhade.png",
    "post text": "Hi everyone!",
    "name": "Akshar Luhade ",
    "type": "text",
    "like": "1k",
    "time": "51min ago",
    "msg": "Let's Play Cricket :)"
  },
  {
    "image": "assets/images/Yash Simp.png",
    "postImage": "assets/images/post6.png",
    "name": "Giselle Branda ",
    "type": "image",
    "like": "15k",
    "time": "1hr ago · Virkshire",
    "msg": "Call me When you are available."
  },
  //======
  // {
  //   "image": "assets/images/rupam.png",
  //   "postImage": "assets/images/post3.png",
  //   "name": "Rupam  ",
  //   "type": "Close Friend America",
  //   "time": "1hr ago",
  //   "msg": "can you help me for this task?"
  // },
  // {
  //   "image": "assets/images/vaibhavi.png",
  //   "postImage": "assets/images/post4.png",
  //   "name": "Nicky ",
  //   "type": "Close Friend Canada",
  //   "time": "2hr ago",
  //   "msg": "I saw you in the Park :)"
  // },
  // {
  //   "image": "assets/images/sweta.png",
  //   "postImage": "assets/images/post1.png",
  //   "name": "Sweta  ",
  //   "type": "Close Friend China",
  //   "time": "3hr ago",
  //   "msg": "bye :)"
  // },
];
