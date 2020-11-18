import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Gallery.dart';
import 'Incircle.dart';

double screenWidth;

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Color green = Color(0xFF0CB5BB);
  Color blue = Color(0xFF424283);
  bool _isPrivate = true;
  bool isPost = true;
  bool isMuse = false;
  bool isTimeline = false;
  bool ownPhoto = true;
  bool tagPhoto = false;
  bool museList = true;
  bool museSync = false;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Gallery();
                  }));
                },
                child: SvgPicture.asset('assets/images/add_btn.svg',
                    width: 24.0, height: 24.0, color: Color(0xFF0CB5BB)),
              ),
              SvgPicture.asset(
                'assets/images/setting.svg',
                width: 24.0,
                height: 24.0,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 15, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: _isPrivate ? green : blue,
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
                            color: _isPrivate ? green : Colors.white,
                            border: Border.all(
                                color: _isPrivate ? green : Colors.white,
                                width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Text(
                          "Private",
                          style: TextStyle(
                              color: _isPrivate ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
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
                            color: _isPrivate ? Colors.white : blue,
                            border: Border.all(
                                color: _isPrivate ? Colors.white : blue,
                                width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Text(
                          "Professional",
                          style: TextStyle(
                              color: _isPrivate ? Colors.grey : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(height: 12.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/profile_photo.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Column(children: [
                    //SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Giselle Branda',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '@gisellebranda',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Sphinx of black quartz, judge my vow',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),

              SizedBox(height: 8.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Incircle();
                    }));
                  },
                  child: Column(
                    children: [
                      Text(
                        '450',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Incircle',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      '100',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      '450',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Posts',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      '100',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Musings',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    width: 140.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: green,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 140.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: green,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        'Message',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height:
                      12.0), // now onwards diff for private and professional
              _isPrivate
                  ? Column(
                      children: [
                        Container(
                          decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xFFFAFAFA),
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0x19000000),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 2.0)
                              ]),
                          //color: Colors.white,
                          //elevation: 5.0,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 15.0, top: 3.0, bottom: 3.0),
                            child: Container(
                              //color: Colors.white,
                              width: screenWidth,
                              height: 50.0,

                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isPost = true;
                                        isMuse = false;
                                        isTimeline = false;
                                      });
                                    },
                                    child: Text(
                                      'Post',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20.0,
                                        color:
                                            isPost ? green : Color(0xFFA7A7A7),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMuse = true;
                                        isPost = false;
                                        isTimeline = false;
                                      });
                                    },
                                    child: Text(
                                      'Muse',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20.0,
                                        color:
                                            isMuse ? green : Color(0xFFA7A7A7),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isTimeline = true;
                                        isMuse = false;
                                        isPost = false;
                                      });
                                    },
                                    child: Text(
                                      'Timeline',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20.0,
                                        color: isTimeline
                                            ? green
                                            : Color(0xFFA7A7A7),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        isPost
                            ? Container(
                                // for post
                                width: screenWidth,
                                child: Column(children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 3.0,
                                        bottom: 3.0),
                                    child: Container(
                                      width: screenWidth,
                                      height: 50.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                ownPhoto = true;
                                                tagPhoto = false;
                                              });
                                            },
                                            child: SvgPicture.asset(
                                              'assets/images/posts.svg',
                                              width: 25.0,
                                              height: 25.0,
                                              color: ownPhoto
                                                  ? Colors.black
                                                  : Color(0xFFA7A7A7),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                ownPhoto = false;
                                                tagPhoto = true;
                                              });
                                            },
                                            child: SvgPicture.asset(
                                              'assets/images/tag.svg',
                                              width: 25.0,
                                              height: 25.0,
                                              color: tagPhoto
                                                  ? Colors.black
                                                  : Color(0xFFA7A7A7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth,
                                    child: ownPhoto
                                        ? GridView.count(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            crossAxisCount: 3,
                                            children: List.generate(6, (index) {
                                              return Container(
                                                width: 125.0,
                                                height: 125.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/posted_photo.png'),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              );
                                            }),
                                          )
                                        : Center(child: Text('tag photoes')),
                                  ),
                                ]),
                              )
                            : isMuse
                                ? Container(
                                    // for muse
                                    width: screenWidth,
                                    child: Column(children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                            top: 3.0,
                                            bottom: 3.0),
                                        child: Container(
                                          width: screenWidth,
                                          height: 50.0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    museList = true;
                                                    museSync = false;
                                                  });
                                                },
                                                child: SvgPicture.asset(
                                                  'assets/images/muse_list.svg',
                                                  width: 21.0,
                                                  height: 16.0,
                                                  color: museList
                                                      ? Colors.black
                                                      : Color(0xFFA7A7A7),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    museList = false;
                                                    museSync = true;
                                                  });
                                                },
                                                child: SvgPicture.asset(
                                                  'assets/images/muse_sync.svg',
                                                  width: 25.0,
                                                  height: 17.0,
                                                  color: museSync
                                                      ? Colors.black
                                                      : Color(0xFFA7A7A7),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth,
                                        child: museList
                                            ? ListView.builder(
                                                itemCount: 3,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 5.0),
                                                    width: screenWidth,
                                                    padding:
                                                        EdgeInsets.all(3.0),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color(
                                                              0xFFDADADA)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        ListTile(
                                                          leading: Container(
                                                            width: 45.0,
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              image:
                                                                  DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/images/profile_photo.png'),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                          title: Text(
                                                            'gisellebranda',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 14.0,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          subtitle: Text(
                                                            '1hr ago · Virkshire',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 14.0,
                                                              color: Color(
                                                                  0xFFA7A7A7),
                                                            ),
                                                          ),
                                                          trailing: Icon(
                                                              Icons.more_vert),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 11.0),
                                                          child: Text(
                                                            'Sphinx of black quartz, judge my vow.',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 18.0,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Spacer(),
                                                            IconButton(
                                                              icon: Icon(
                                                                Icons.favorite,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )
                                            : SizedBox(
                                                child: Text('Muse part')),
                                      ),
                                    ]),
                                  )
                                : Container(
                                    margin: EdgeInsets.only(top: 5.0),
                                    width: screenWidth,
                                    child: ListView.builder(
                                        itemCount: 5,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 30.0,
                                                    backgroundColor: green,
                                                    child: CircleAvatar(
                                                      radius: 28.0,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              (index + 1)
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 25.0,
                                                                color: green,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                            Text(
                                                              'oct',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 10.0,
                                                                color: green,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15.0),
                                                  Text(
                                                    'Watched some movie',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 18.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              index != 4
                                                  ? Container(
                                                      margin: EdgeInsets.only(
                                                          left: 28.0),
                                                      width: 3.0,
                                                      height: 8.0,
                                                      color: Colors.grey,
                                                    )
                                                  : SizedBox(),
                                            ],
                                          );
                                        }),
                                  ),
                      ],
                    )
                  : Text('Professional Account'), // end of col
            ],
          ),
        ),
      ),
    );
  }
}
