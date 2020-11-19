import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yibe_final_ui/pages/Conversation.dart';

class Messages extends StatefulWidget {
//  static final routeName = "/Message";

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  var activeTabInList = 0;
  bool _isPrivate = true;
  bool _isStared = false;
  Color _blue;
  Color _green;
  List<Map> priAll = [];
  List<Map> priStar = [];
  List<Map> proAll = [];
  List<Map> proStar = [];
  List list2 = ["Friends", "Close Friends", "Acquaintance"];
  List<Map> temp = [];

  @override
  void initState() {
    priAll.add(_allUsers[0]);
    priAll.add(_allUsers[1]);
    priAll.add(_allUsers[2]);
    priAll.add(_allUsers[3]);
    priAll.add(_allUsers[4]);
    priAll.add(_allUsers[5]);
    priAll.add(_allUsers[6]);

    priStar.add(_allUsers[2]);
    priStar.add(_allUsers[5]);
    priStar.add(_allUsers[6]);
    priStar.add(_allUsers[8]);

    proStar.add(_allUsers[1]);
    proStar.add(_allUsers[2]);
    proStar.add(_allUsers[5]);

    proAll.add(_allUsers[1]);
    proAll.add(_allUsers[2]);
    proAll.add(_allUsers[3]);
    proAll.add(_allUsers[5]);
    proAll.add(_allUsers[6]);
    proAll.add(_allUsers[8]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _blue = hexToColor("#424283");
    _green = hexToColor("#0CB5BB");
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        // if (details.delta.dx > 0) {
        //   Navigator.of(context).pop();
        // }
      },
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(46.0),
            child: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              title: Text(
                "Messages",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: 12, right: 15, left: 15),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFFAFAFA),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPrivate = !_isPrivate;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                border: Border.all(
                                    color: Color(0xFFFAFAFA), width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Text(
                              "Private",
                              style: TextStyle(
                                  color: _isPrivate ? _green : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPrivate = !_isPrivate;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                border: Border.all(
                                    color: Color(0xFFFAFAFA), width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Text(
                              "Professional",
                              style: TextStyle(
                                  color: _isPrivate ? Colors.grey : _blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 30,
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          style: TextStyle(fontSize: 15),
                          decoration: new InputDecoration(
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 0),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: _isPrivate ? _green : _blue,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: _isPrivate ? _green : _blue,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Search',
                          ),
                        )),

                        //=================================================================================================================
                        SizedBox(
                          width: 10,
                        ),

                        Container(
                          height: 24,
                          // width: 80,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: _isPrivate ? _green : _blue,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          //  width: screenWidth,
                          child: Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isStared = !_isStared;
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: _isPrivate
                                          ? !_isStared
                                              ? _green
                                              : Colors.white
                                          : !_isStared
                                              ? _blue
                                              : Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Text(
                                    "All",
                                    style: TextStyle(
                                        color: _isPrivate
                                            ? !_isStared
                                                ? Colors.white
                                                : _isPrivate
                                                    ? _green
                                                    : _blue
                                            : !_isStared
                                                ? Colors.white
                                                : _isPrivate
                                                    ? _green
                                                    : _blue,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isStared = !_isStared;
                                  });
                                },
                                child: Container(
                                    width: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: _isPrivate
                                            ? _isStared
                                                ? _green
                                                : Colors.white
                                            : _isStared
                                                ? _blue
                                                : Colors.white,
                                        // border: Border.all(
                                        //     color:
                                        //         _isPrivate ? Colors.white : _blue,
                                        //     width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Icon(Icons.star,
                                        size: 20,
                                        color: _isPrivate
                                            ? _isStared
                                                ? Colors.white
                                                : _isPrivate
                                                    ? _green
                                                    : _blue
                                            : _isStared
                                                ? Colors.white
                                                : _isPrivate
                                                    ? _green
                                                    : _blue)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _isPrivate ? SizedBox(height: 12) : Container(),
                  _isPrivate
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: list2.length,
                              itemBuilder: (context, index) {
                                var item = list2[index];
                                return GestureDetector(
                                    //   color: Colors.red,
                                    onTap: () {
                                      setState(() {
                                        activeTabInList = index;
                                        setState(() {});

                                        // Scaffold.of(context).showSnackBar(SnackBar(
                                        //   duration: Duration(milliseconds: 200),
                                        //   content: Text(item)));
//                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 16.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        child: Column(
                                          children: [
                                            Text(
                                              item,
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color:
                                                      activeTabInList == index
                                                          ? Color(0xff008294)
                                                          : Colors.grey),
                                            ),
                                            activeTabInList == index
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.black87,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    width: index == 0
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.2
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    height: 1,
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                    ));
                              }),
                        )
                      : Container(),
                  //  _isPrivate?

//
//                                   ListView.builder(
//                                 //  key: ObjectKey(list2[0]),
//                                // controller: _controller,
//                                 scrollDirection: Axis.horizontal,
//                                 shrinkWrap: true,
//                                 itemCount: list2.length,
//                                 itemBuilder: (context, index) {
//                                   var item = list2[index];
// //                                   return FlatButton(
// //                                       onPressed: () {
// //                                         setState(() {
// //                                           Scaffold.of(context).showSnackBar(SnackBar(content: item));
// // //                                        isVisible = !isVisible;
// //                                         });
// //                                       },
// //                                       child: Text(item));
//                                 })
//                          :Container(),

                  //  SizedBox(height: 15),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _isPrivate
                          ? _isStared
                              ? priStar.length
                              : priAll.length
                          : _isStared
                              ? proStar.length
                              : proAll.length,
                      itemBuilder: (context, index) {
                        if (_isPrivate) {
                          if (_isStared)
                            temp = priStar;
                          else
                            temp = priAll;
                        } else {
                          if (_isStared)
                            temp = proStar;
                          else
                            temp = proAll;
                        }

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ConversationPage(
                                name: temp[index]["name"],
                                image: temp[index]["image"],
                                isPersonal: _isPrivate,
                              );
                            }));
                          },
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.all(0),
                                leading: CircleAvatar(
                                  backgroundImage: temp[index]["image"],
                                  radius: 29,
                                ),
                                title: Container(
                                  padding: EdgeInsets.only(bottom: 13),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          temp[index]["name"],
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(
                                          temp[index]["time"],
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      ]),
                                ),
                                subtitle: Text(temp[index]["msg"]),
                              ),
                              Divider(
                                height: 0,
                              )
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          )),
    );
  }

  List<Map> _allUsers = [
    {
      "image": AssetImage("assets/images/simba.png"),
      "name": "Sim.dev  ",
      "type": "Close Friend",
      "time": "2 minutes ago",
      "msg": "What’s Up"
    },
    {
      "image": AssetImage("assets/images/sundar.png"),
      "name": "Sunder  ",
      "type": "Friend",
      "time": "1 hour ago",
      "msg": "What's Up"
    },
    {
      "image": AssetImage("assets/images/rujuta.png"),
      "name": "Rujuta  ",
      "type": "Close Friend",
      "time": "1 hour ago",
      "msg": "What's up"
    },
    {
      "image": AssetImage("assets/images/yash.png"),
      "name": "Yash  ",
      "type": "Friend",
      "time": "5 hours ago",
      "msg": "Whats Up"
    },
    {
      "image": AssetImage("assets/images/nicky.png"),
      "name": "Nicky",
      "type": "Close Friend",
      "time": "yesterday",
      "msg": "Hi!"
    },
    {
      "image": AssetImage("assets/images/rajani.png"),
      "name": "Rajani  ",
      "type": "Friend",
      "time": "2 weeks ago",
      "msg": "Hi"
    },
    {
      "image": AssetImage("assets/images/rupam.png"),
      "name": "Rupam  ",
      "type": "Close Friend",
      "time": "4 weeks ago",
      "msg": "Hi"
    },
    {
      "image": AssetImage("assets/images/vaibhavi.png"),
      "name": "Vaibhavi  ",
      "type": "Close Friend",
      "time": "1 month ago",
      "msg": "Hi"
    },
    {
      "image": AssetImage("assets/images/sweta.png"),
      "name": "Shweta ",
      "type": "Close Friend",
      "time": "1 month ago",
      "msg": "Hi"
    },
  ];
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
