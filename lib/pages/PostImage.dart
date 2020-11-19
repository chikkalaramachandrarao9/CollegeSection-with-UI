import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

double screenWidth;

class PostImage extends StatefulWidget {
  final File selectedImage;
  PostImage({Key key, this.selectedImage}) : super(key: key);

  @override
  _PostImageState createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> {
  bool _isPrivate = true;
  Color green = Color(0xFF0CB5BB);
  Color blue = Color(0xFF424283);
  bool isFriend = true;
  bool isCloseFriend = true;
  bool isEveryOne = true;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
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
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        "assets/images/back_btn.svg",
                        width: 30,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Spacer(),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: LayoutBuilder(builder: (context, constraints) {
              double gridWidth = (constraints.maxWidth - 20) / 3;
              double gridHeight = gridWidth + 33;
              double ratio = gridWidth / gridHeight;
              return Container(
                  padding: EdgeInsets.all(5),
                  child: Column(children: [
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
                                    color:
                                        _isPrivate ? Colors.white : Colors.grey,
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
                                  color: _isPrivate ? Colors.white : blue,
                                  border: Border.all(
                                      color: _isPrivate ? Colors.white : blue,
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              child: Text(
                                "Professional",
                                style: TextStyle(
                                    color:
                                        _isPrivate ? Colors.grey : Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          color: Colors.grey[300],
                          height: gridWidth,
                          width: gridWidth,
                          child: FadeInImage(
                              fit: BoxFit.cover,
                              placeholder: AssetImage(
                                  'assets/images/photo-placeholder-icon-7.jpg'),
                              image: FileImage(widget.selectedImage)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFF0CB5BB), width: 2.0),
                            ),
                            hintText: 'Caption'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Row(
                        children: [],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    _isPrivate
                        ? Column(
                            // for private account
                            children: [
                              SizedBox(
                                width: screenWidth,
                                child: Row(children: [
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isCloseFriend = true;
                                        isEveryOne = false;
                                        isFriend = false;
                                      });
                                    },
                                    child: Text(
                                      'Close Friends',
                                      style: TextStyle(
                                        color: isCloseFriend
                                            ? Colors.black
                                            : Color(0xFFA7A7A7),
                                        fontFamily: 'Poppins',
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '>',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isCloseFriend = true;
                                        isEveryOne = false;
                                        isFriend = true;
                                      });
                                    },
                                    child: Text(
                                      'Friends',
                                      style: TextStyle(
                                        color: isFriend
                                            ? Colors.black
                                            : Color(0xFFA7A7A7),
                                        fontFamily: 'Poppins',
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '>',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isCloseFriend = true;
                                        isEveryOne = true;
                                        isFriend = true;
                                      });
                                    },
                                    child: Text(
                                      'Everyone',
                                      style: TextStyle(
                                        color: isEveryOne
                                            ? Colors.black
                                            : Color(0xFFA7A7A7),
                                        fontFamily: 'Poppins',
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                ]),
                              ),
                              Center(
                                child: Text(
                                  'Slide into your friendzone ',
                                  style: TextStyle(
                                    color: Color(0xFFA7A7A7),
                                    fontFamily: 'Poppins',
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Text(
                              ' Professional posts are always public. ',
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: FlatButton(
                                onPressed: () {},
                                color: _isPrivate ? green : blue,
                                child: Text('Post',
                                    style: TextStyle(color: Colors.white))))),
                  ]));
            }),
          ),
        ));
  }
}
