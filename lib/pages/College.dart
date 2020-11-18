import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yibe_final_ui/pages/Message.dart';
import 'package:yibe_final_ui/pages/Money/MoneyMatters.dart';
import 'package:yibe_final_ui/pages/Notification.dart';
import 'package:yibe_final_ui/pages/college_section_page.dart';

import 'Preferences.dart';

class College extends StatefulWidget {
  static final routeName = "/College";
  Function hiberPopUp;
  College({this.hiberPopUp});
  @override
  _CollegeState createState() => _CollegeState();
}

class _CollegeState extends State<College> {
  int _currentIndex = 1;
  List<String> cardList = [
    'assets/images/poster1.png',
    'assets/images/poster2.png',
    'assets/images/poster3.png'
  ];
  List<String> cardList2 = [
    'assets/images/hustle1.png',
    'assets/images/hustle2.png',
    'assets/images/hustle3.png'
  ];
  List cardList1 = [Item4(), Item5(), Item6()];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
            backgroundColor: Color(0xFFFFFFFF),
            actions: <Widget>[
              Container(
                color: Colors.white,
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
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Spacer(),
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
                        child: Icon(Icons.send, color: Colors.black, size: 28)),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              // padding: const EdgeInsets.all(12.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Hello,',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(children: <Widget>[
                    SizedBox(width: 15.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Preferences();
                        }));
                      },
                      child: Container(
                          child: Text(
                        "Simba",
                        style: TextStyle(
                            color: Color(0xff008294),
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      )),
                    )
                  ]),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CollegeSectionPage(
                                activepassedvalue: 0,
                              );
                            }));
                          },
                          child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Container(
                                height: 200,
                                child: SvgPicture.asset(
                                    'assets/images/Group 545.svg',
                                    fit: BoxFit.contain),
                                // child: Center(
                                //   child: Text(
                                //     'Events',
                                //     style: TextStyle(
                                //         color: Colors.white, fontSize: 25.0),
                                //   ),
                                // ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CollegeSectionPage(
                                activepassedvalue: 1,
                              );
                            }));
                          },
                          child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Container(
                                height: 200,
                                child: SvgPicture.asset(
                                    'assets/images/Frame 96.svg',
                                    fit: BoxFit.contain),
                                // child: Center(
                                //   child: Text(
                                //     'Growth+',
                                //     style: TextStyle(
                                //         color: Colors.white, fontSize: 25.0),
                                //   ),
                                // ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CollegeSectionPage(
                                activepassedvalue: 2,
                              );
                            }));
                          },
                          child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Container(
                                height: 200,
                                child: SvgPicture.asset(
                                    'assets/images/Frame 99.svg',
                                    fit: BoxFit.contain),
                                // child: Center(
                                //   child: Text(
                                //     'Activities',
                                //     style: TextStyle(
                                //         color: Colors.white, fontSize: 25.0),
                                //   ),
                                // ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MoneyMatters(
                                  "aN0NOsFLWoO4snOJBgi8oI89j2r1");
                            }));
                          },
                          child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Container(
                                height: 200,
                                child: SvgPicture.asset(
                                    'assets/images/Frame 94.svg',
                                    fit: BoxFit.contain),
                                // child: Center(
                                //   child: Column(
                                //     children: [
                                //       Text(
                                //         'Money',
                                //         style: TextStyle(
                                //             color: Colors.white,
                                //             fontSize: 25.0),
                                //       ),
                                //       Text(
                                //         'Matters ',
                                //         style: TextStyle(
                                //             color: Colors.white,
                                //             fontSize: 25.0),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              )),
                        ),
                      ],
                    ),
                  ),

                  //

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Hot ",
                          style: TextStyle(
                            fontSize: 36,
                            color: Color.fromRGBO(9, 128, 145, 1), //Green shade
                          )),
                      TextSpan(
                        text: "'n Happening",
                        style: TextStyle(fontSize: 36, color: Colors.black),
                      )
                    ])),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      initialPage: 1,
                      height: 180.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 2.0,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: cardList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: DecorationImage(
                                    image: AssetImage(
                                      card,
                                    ),
                                    fit: BoxFit.fill)),
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            // child: Card(
                            //   color: Colors.white,
                            //   child: card,
                            // ),
                          ),
                        );
                      });
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 8.0),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Vibe ",
                          style: TextStyle(
                            fontSize: 36,
                            color: Color.fromRGBO(9, 128, 145, 1), //Green shade
                          )),
                      TextSpan(
                        text: "with someone",
                        style: TextStyle(fontSize: 36, color: Colors.black),
                      )
                    ])),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        // border: Border.all(
                        //   color: Colors.black,
                        //   width: 1.0,
                        // ),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/collegePage_map.png"),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 8, bottom: 8),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Everyday ",
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.black, //Green shade
                          )),
                      TextSpan(
                        text: "Hustle",
                        style: TextStyle(
                          fontSize: 36,
                          color: Color.fromRGBO(9, 128, 145, 1),
                        ),
                      )
                    ])),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      initialPage: 1,
                      height: 180.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 2.0,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: cardList2.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(
                                      card,
                                    ),
                                    fit: BoxFit.fill)),
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            // child: Card(
                            //   color: Colors.white,
                            //   child: card,
                            // ),
                          ),
                        );
                      });
                    }).toList(),
                  ),
                  // CarouselSlider(
                  //   options: CarouselOptions(
                  //     height: 200.0,
                  //     autoPlay: true,
                  //     autoPlayInterval: Duration(seconds: 3),
                  //     autoPlayAnimationDuration: Duration(milliseconds: 800),
                  //     autoPlayCurve: Curves.fastOutSlowIn,
                  //     pauseAutoPlayOnTouch: true,
                  //     aspectRatio: 2.0,
                  //     onPageChanged: (index, reason) {
                  //       setState(() {
                  //         _currentIndex = index;
                  //       });
                  //     },
                  //   ),
                  //   items: cardList1.map((card) {
                  //     return Builder(builder: (BuildContext context) {
                  //       return Container(
                  //         height: MediaQuery.of(context).size.height * 0.30,
                  //         width: MediaQuery.of(context).size.width,
                  //         child: Card(
                  //           color: Colors.white,
                  //           child: card,
                  //         ),
                  //       );
                  //     });
                  //   }).toList(),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final String imageSrc;
  final String imageTitle;
  const ActivityTile({
    Key key,
    this.imageSrc,
    this.imageTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(imageSrc);
    return Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
        ),
        child: SvgPicture.asset(
          'assets/images/growth_college_section_page.svg',
          height: 180.0,
          fit: BoxFit.contain,
        ));
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/account_circle_24px.svg',
            height: 180.0,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/account_circle_24px.svg',
              height: 180.0,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    ]);
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/account_circle_24px.svg',
            height: 180.0,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/hustle1.svg',
            height: 180.0,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}

class Item5 extends StatelessWidget {
  const Item5({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/Hustle2.svg',
            height: 180.0,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}

class Item6 extends StatelessWidget {
  const Item6({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/hustle3.svg',
            height: 180.0,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
