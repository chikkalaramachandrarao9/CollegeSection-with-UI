import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yibe_final_ui/pages/PageHandler.dart';



class DynamicDetails extends StatefulWidget {
  static final routename = "/DynamicDetails";
  final type;
  final String image;
  final String userImage;
  final List<String> tags;
  final String price;
  final String date;
  final String time;
  final String location;
  final String title;
  final int totalNoofparticipation;
  DynamicDetails({
    Key key,
    this.image,
    this.userImage,
    this.tags,
    this.type,
    this.price,
    this.date,
    this.time,
    this.location,
    this.title,
    this.totalNoofparticipation,
  }) : super(key: key);
  @override
  _DynamicDetailsState createState() => _DynamicDetailsState();
}

class _DynamicDetailsState extends State<DynamicDetails>
    with TickerProviderStateMixin {
  TextEditingController textEditingController = new TextEditingController();
  final event = "Events Details";
  final internship = "Internship";
  final quickFixes = "QuickFixes";
  final projects = "projects";
  final sports = "Activity Sports";
  final peerLearn = "Activity Skills+(Peer Learn)";
  final socialLearn = "Activity Skills+(Social Learn)";
  final eSports = "Activity ESports Online";
  bool isLiked = true;
  bool _showResources = false;
  bool _showDiscription = false;
  bool _showRules = false;
  bool _showDisclaimer = false;
  bool _showTermsAndConditions = false;
  int selectedIndex = -1;
  bool _isConformed = false;

  List<String> skillsReq = ["Flutter", "Android", "IPhoneDev"];

  ScrollController _scrollController = new ScrollController();

  List<String> a = [
    "Bat",
    "Ball",
  ];
  List<String> b = ["Drinks", "Speakers", "Wickets", "Stumps", "Helmet"];

  // List<String> list = [];
  var type;
  // var _index = 0;

  //==================================  for Internship Image Slider ===============================================
  final List<String> friendList = [
    'assets/images/friend1.png'
        'assets/images/friend2.png'
        'assets/images/friend3.png'
        'assets/images/friend4.png'
        'assets/images/friend5.png'
  ];
  // final List<String> imgList = [
  //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  //   // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  //   // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  //   // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  //   // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  //   // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  // ];
  List<Widget> imageSliders;
  var _current = 1;

  @override
  void initState() {
    type = widget.type;
    // type = event;
    // list.add(event);
    // list.add(internship);
    // list.add(quickFixes);
    // list.add(projects);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Visibility(
          // visible: !pressed,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Color(0xFF0CB5BB),
            onPressed: () {
              // openBottomModelSheet();
              //   _pc.show();
              setState(() {
                //  pressed = true;
              });
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          // notchMargin: 10,
          child: Container(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return PageHandler();
                      }), (route) => false);
                    },
                    child: SvgPicture.asset(
                      "assets/images/home-24px 1.svg",
                      height: 30,
                      // color:
                      //   currentTab == 0 ? Color(0xFFFD8F6E) : Colors.black
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      "assets/images/account_balance_24px.svg",
                      height: 30,
                      color: Color(0xFF0CB5BB),
                    ),
                  ),
                  SizedBox.shrink(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return PageHandler();
                      }), (route) => false);
                    },
                    child: SvgPicture.asset(
                      "assets/images/language_24px.svg",
                      height: 30,
                      // color: currentTab == 2 ? Color(0xFFFD8F6E) : Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return PageHandler();
                      }), (route) => false);
                    },
                    child: SvgPicture.asset(
                      "assets/images/account_circle_24px.svg",
                      height: 30,
                      //  color: currentTab == 3 ? Color(0xFFFD8F6E) : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
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
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30.0,
                      )),
                  Spacer(),
                  SvgPicture.asset(
                    "assets/images/green_logo.svg",
                    width: 30,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 50,
                  ),
                ],
              ),
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),

                      // SizedBox(
                      //   height: 30,
                      //   width: MediaQuery.of(context).size.width,
                      //   child: ScrollablePositionedList.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: 500,
                      //     itemBuilder: (context, index) => Text('Item $index'),
                      //     itemScrollController: itemScrollController,
                      //     itemPositionsListener: itemPositionsListener,
                      //   ),
                      // ),
                      //=============================== events , internship , quick , projects, sports , peerLearn , socialLearn , ESport
                      _imageAndTages(),
                      //=============================== events , internship , quick , projects, sports , peerLearn , socialLearn , ESport
                      _title(),
                      //== ______ , __________ , _____ , ________ , sports , peerLearn , socialLearn , ESport
                      _activityTitle_Time_Location(),
                      //=============================== events , internship , quick , _______ , ______ , _________ , ___________ , ______
                      _dateTimeLocation(),
                      //=============================== events , __________ , _____ , _______ , ______ , _________ , ___________ , ______
                      _friendsAndArtist(),
                      //=============================== ______ , internship , quick , _______ , ______ , _________ , ___________ , ______
                      _workDetails(),

                      //=============================== ______ , __________ , _____ , Projects , ______ , _________ , ___________ , ______
                      _stage_Progress_Team(),

                      //=============================== ______ , __________ , _____ , ________ , sports , peerLearn , socialLearn , ESport
                      _resourse_Disc_Rules(),

                      //=============================== events , internship , quick , projects , sports , peerLearn , socialLearn , ESport
                      _disclaimer(),

                      //=============================== events , __________ , _____ , ________ ,  ______ , _________ , ___________ , ______
                      _termsAndConditions(),

                      SizedBox(
                        height: 65,
                      )
                    ],
                  ),
                ),
              ),
              //== events , internship , quick , projects
              _bottomBar(),
            ],
          ),
        ));
  }

  _imageAndTages() {
    imageSliders = [widget.image]
        .map((item) => Container(
              height: 500,
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      //  color: list[new Random().nextInt(5)],
                      blurRadius: 2.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: Offset(
                          4.0, // Move to right 10  horizontally
                          5 // Move to bottom 10 Vertically
                          ),
                    )
                  ],
                ),
                height: 500,
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    child: Stack(
                      children: <Widget>[
                        Container(),
                        Image.asset(
                          'assets/images/money_matter_college_section_page.png',
                          fit: BoxFit.fitWidth,
                          width: 1000.0,
                          height: 1000,
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //===============================================================================  Event Details Image  ======================================================

        if (type != internship)
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    // color: Colors.black45,
                    color: type == quickFixes || type == sports
                        ? hexToColor("#00D09E")
                        : type == projects ||
                                type == peerLearn ||
                                type == socialLearn
                            ? hexToColor("#F89E26")
                            : type == eSports
                                ? hexToColor("#75A4FF")
                                : Colors.white,
                    // color: hexToColor("#00D09E"),
                    blurRadius: 2.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(
                        0.0, // Move to right 10  horizontally
                        4 // Move to bottom 10 Vertically
                        ),
                  )
                ],
              ),
              // decoration: BoxDecoration(
              //     color: Colors.blueGrey,
              //     border: Border.all(color: Colors.blue[500], width: 3),
              //     borderRadius: BorderRadius.all(Radius.circular(20))),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Container(
                decoration: BoxDecoration(
                  color: hexToColor("#d4d4d4"),
                  border: type == event
                      ? Border.all(color: Colors.blue[500], width: 3)
                      : Border.all(width: 0, color: hexToColor("#d4d4d4")),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage(
                        widget.image,
                      ),

                      //NetworkImage(imgList[4]),

                      fit: BoxFit.cover),
                ),

                // child: ClipRRect(
                //     borderRadius: BorderRadius.all(Radius.circular(18.0)),
                //     child: Stack(
                //       children: <Widget>[
                //         Container(),
                //         Image.network(
                //           imgList[4],
                //           fit: BoxFit.cover,
                //           width: 1000.0,
                //           height: 1000,
                //         ),
                //       ],
                //     )),
                //    color: Colors.white,
              )),

        //=============================================================================  Image for iternship ============================

        if (type == internship)
          Stack(alignment: Alignment.center, children: [
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Positioned(
              bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [widget.image].map((url) {
                  int index = [widget.image].indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index ? Colors.white : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ),
          ]),

        //==================================================================================   Tages =============================

        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15),
              Flexible(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.tags.length,
                          itemBuilder: (context, index) {
                            var tag = widget.tags[index];
                            return Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: Text(
                                      '#$tag',
                                      style: TextStyle(
                                          color: type == quickFixes ||
                                                  type == internship ||
                                                  type == projects ||
                                                  type == event
                                              ? hexToColor("#424283")
                                              : hexToColor("#0CB5BB"),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                )
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
              //     Spacer(),
              if (type == event)
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/images/favorite.svg',
                      color: isLiked ? Colors.red : hexToColor("#d4d4d4"),
                    )),
              if (type == event) SizedBox(width: 15),
            ],
          ),
        ),
      ],
    );
  }

  //=========================================================================================================================================
  //---------------------------------------------------------------------------------   Title Function --------------------------------------
  //==========================================================================================================================================

  _title() {
    if (type == event || type == projects) {
      return Container(
        margin: const EdgeInsets.only(top: 10, right: 15, left: 15),
        width: MediaQuery.of(context).size.width,
        child: Text(
          type == event ? widget.title : "Project Name ",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      );
    }

    if (type == internship) {
      return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Text(
                    "Company Name ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SvgPicture.asset('assets/images/open_in_new.svg'),
                  Spacer(),
                  SvgPicture.asset('assets/images/openings.svg'),
                  Container(
                    alignment: Alignment.center,
                    width: 70,
                    child: Text(
                      " 1000",
                      style: TextStyle(
                          color: hexToColor("#424283"),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Text(
                    "Web Developer ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/images/applied_Icon.svg'),
                  Container(
                    alignment: Alignment.center,
                    width: 70,
                    child: Text(
                      " 10",
                      style: TextStyle(
                          color: hexToColor("#424283"),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Row(),
          ],
        ),
      );
    }

    if (type == quickFixes ||
        type == sports ||
        type == peerLearn ||
        type == socialLearn ||
        type == eSports) {
      return Padding(
        padding: const EdgeInsets.only(top: 0, right: 15, left: 15),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: CircleAvatar(
            backgroundImage: AssetImage(widget.userImage),
            radius: 25,
          ),
          title: Row(
            children: [
              Text(widget.type == sports ? "Yash Simp" : "Tarang Soni ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              SvgPicture.asset('assets/images/verified_user.svg'),
            ],
          ),
          subtitle: Text(widget.type == sports ? "@yeashSimp" : "@MeGaribHu",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500)),
          trailing: type == quickFixes
              ? SizedBox()
              : type != peerLearn
                  ? SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset('assets/images/users_icon.svg'),
                          Text(
                            " 7/10 ",
                            style: TextStyle(
                                fontSize: 18,
                                color: hexToColor("#0CB5BB"),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  : SizedBox(),
        ),
      );
    }

    return SizedBox();
  }

  //=========================================================================================================================================
  //--------------------------------------------------------------------------------- Activity Title , Time , Location ,Website Function ----------
  //==========================================================================================================================================

  _activityTitle_Time_Location() {
    if (type == sports ||
        type == peerLearn ||
        type == socialLearn ||
        type == eSports)
      return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Galli Cricket (One-Tip)",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/images/end_icon.svg"),
                  SizedBox(width: 10),
                  Text(
                    "31st Mar '20 | 24:24 PM",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
            if (type == sports || type == peerLearn)
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/location.svg"),
                    SizedBox(width: 10),
                    Text(
                      widget.location,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ),
            if (type == eSports || type == socialLearn)
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/images/language_24px.svg",
                      height: 22,
                      color: hexToColor("#6197FF"),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "WWW.Yibe.com",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              )
          ],
        ),
      );
    return SizedBox();
  }

  //=========================================================================================================================================
  //---------------------------------------------------------------------------------   Date Time Location Function --------------------------------------
  //==========================================================================================================================================

  _dateTimeLocation() {
    if (type == sports ||
        type == peerLearn ||
        type == socialLearn ||
        type == eSports) {
      return SizedBox();
    }

    if (type != projects)
      return Padding(
        padding: EdgeInsets.only(top: 10, left: 25, right: 15),
        child: Column(
          children: [
            if (type == internship || type == quickFixes)
              Row(
                children: [
                  SvgPicture.asset('assets/images/play_circle.svg'),
                  SizedBox(width: 5),
                  Text(
                    "${widget.date} | ${widget.time}",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                ],
              ),
            SizedBox(height: type == internship || type == quickFixes ? 5 : 0),
            if (type == internship || type == quickFixes)
              Row(
                children: [
                  SvgPicture.asset('assets/images/money.svg'),
                  SizedBox(width: 5),
                  Text(
                    "${widget.price} ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                ],
              ),
            if (type == event)
              Row(
                children: [
                  SvgPicture.asset('assets/images/calender.svg'),
                  SizedBox(width: 5),
                  Text(
                    "${widget.date} ${widget.time}",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                ],
              ),
            SizedBox(height: type == event ? 5 : 0),
            Row(
              children: [
                SvgPicture.asset('assets/images/location.svg'),
                SizedBox(width: 5),
                Text(
                  widget.location,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SvgPicture.asset('assets/images/hourglass.svg'),
                SizedBox(width: 5),
                Text(
                  "2 hours",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                )
              ],
            ),
            SizedBox(height: 5),
            if (type == event)
              Row(
                children: [
                  Icon(
                    Icons.supervised_user_circle,
                    color: hexToColor("#424283"),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "${widget.totalNoofparticipation}",
                    //   "${widget.totalNoofparticipation}",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                ],
              ),
          ],
        ),
      );

    return SizedBox();
  }

  //=========================================================================================================================================
  //---------------------------------------------------------------------------------   Friends, Artist and Event Details Function --------------------------------------
  //==========================================================================================================================================

  _friendsAndArtist() {
    if (type == event)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "Which friend are attending ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  if (index == 0)
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/friend1.png'),
                        radius: 25,
                        backgroundColor: hexToColor("#d4d4d4"),
                      ),
                    );
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/friend${index + 1}.png'), // AssetImage('assets/images/single_point_map.png'),
                      radius: 25,
                      backgroundColor: hexToColor("#d4d4d4"),
                    ),
                  );
                }),
          ),

          //============================  Artists  ===============================================    Artists    =======

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "Key Speaker/ Artist",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  if (index == 0)
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/speaker.png'),
                        radius: 25,
                        backgroundColor: hexToColor("#d4d4d4"),
                      ),
                    );
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CircleAvatar(
                      //  backgroundImage: AssetImage('assets/images/single_point_map.png'),
                      radius: 25,
                      backgroundColor: hexToColor("#d4d4d4"),
                    ),
                  );
                }),
          ),

          //===========================================================================  Event Details  ===================================================

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "Event Details ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "This very random organisation at this spectacualr venue presents an evening of Jazz. Jazz in India is a avery niche interest since most of the indian to fight against western lassical enthusiasts who think that the genre is flawed like come on bro just let people have some fun.   \n\n => This Font Size is 10 / According to Figma. ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      );

    return SizedBox();
  }

  //=========================================================================================================================================
  //--------------------------------------------------------------------------------- Work,  Friends, Artist and Event Details Function --------------------------------------
  //==========================================================================================================================================

  _workDetails() {
    if (type == quickFixes) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //=========================================  Work Detils  ============================================

          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Text(
              "Work Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "This very random organisation at this spectacualr venue presents an evening of Jazz. Jazz in India is a avery niche interest since most of the indian population holds a bad thing against western culture and thinks that indian \n \n => This Font Size is 10 / According to Figma",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            ),
          ),

          //========================================   Skills Required  ==========================================

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "Skills Required",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: skillsReq.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: index == 0 ? 15 : 8),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: hexToColor("#424283"),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            skillsReq[index],
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),

          //============================================================================   work Diretion ==============================

          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Text(
              "Work Direction",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "This very random organisation at this spectacualr venue presents an evening of Jazz. Jazz in India is a avery niche interest since most of the indian population holds a bad thing against western culture and thinks that indian \n \n => This Font Size is 12. ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      );
    }

    if (type == internship)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //=================================================================================  Work Detils  ============================================

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "Work Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
          ),

          //======================================================================================  Perks  ================================================

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Text(
              "Perks",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: index == 0 ? 15 : 8),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: hexToColor("#424283"),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              "Certificate",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),

          //===============================================================================   Skills Required  ==========================================

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "Skills Required",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: index == 0 ? 15 : 8),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: hexToColor("#424283"),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "Flutter",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),

          //=================================================================================    Eligibility  =============================================

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "Eligibility",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),

          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 7),
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 3),
                        Text("- 2nd year and above in BTech"),
                      ],
                    );
                  })),

          //==================================================================================    Assignments   =============================================

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              "Assignments",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),

          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 7),
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 3),
                        Text("- Wrbsite development ( FrontEnd )"),
                      ],
                    );
                  })),

          //============================  About Company  ===================================================

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "About Company ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "This very random organisation at this spectacualr venue presents an evening of Jazz. Jazz in India is a avery niche interest since most of the indian thinks that indian classical is the ultimate genre of music that should be loved by everyone but the masters of the art should for some reason keep the knowledge a secret. the Jazz fans on the internet are annoying and well jazz community has to fight against western lassical enthusiasts who think that the genre is flawed like come on bro just let people have some fun. ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  SizedBox(width: index == 0 ? 15 : 8),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        //color: hexToColor("#424283"),
                                        border: Border.all(
                                            color: hexToColor("#424283")),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3))),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );

    return SizedBox();
  }

  //=========================================================================================================================================
  //---------------------------------------------------------------------------------   Stage Progress Team Function --------------------------------------
  //==========================================================================================================================================

  _stage_Progress_Team() {
    if (type == projects) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "Stage & Brief Idea",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  bool flag = index % 2 == 0 ? true : false;
                  return Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            'assets/images/stage_${index + 1}_${flag}.svg'),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "This very random organisation at this spectacualr venue presents an evening of Jazz. Jazz in India is a avery niche interest since most of the indian  think that the genre is flawed like come on bro just let people have some fun. ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          //============================================================================== Team Required ==================================
          Container(
            margin: selectedIndex == -1
                ? EdgeInsets.all(0)
                : EdgeInsets.only(left: 15, right: 15),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: selectedIndex == -1
                  ? BorderRadius.all(Radius.circular(0))
                  : BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                selectedIndex == -1
                    ? BoxShadow()
                    : BoxShadow(
                        color: Colors.black45,
                        //  color: list[new Random().nextInt(5)],
                        blurRadius: 2.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                        offset: Offset(
                            0.0, // Move to right 10  horizontally
                            0 // Move to bottom 10 Vertically
                            ),
                      )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (selectedIndex != -1)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = -1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                  ),
                if (selectedIndex == -1)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Text(
                      "Team Required",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),

                // ScrollablePositionedList.builder(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: 500,
                //         itemBuilder: (context, index) => Text('Item $index'),
                //         itemScrollController: itemScrollController,
                //         itemPositionsListener: itemPositionsListener,
                //       ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            // if (selectedIndex == -1 || index == 0)
                            SizedBox(width: index == 0 ? 15 : 8),
                            // if (selectedIndex == -1 || selectedIndex == index)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (selectedIndex == index) {
                                    selectedIndex = -1;
                                  } else {
                                    selectedIndex = index;
                                    _scrollController.animateTo(
                                      selectedIndex == -1
                                          ? 0.0
                                          : selectedIndex.toDouble() * 98,
                                      curve: Curves.easeOut,
                                      duration:
                                          const Duration(milliseconds: 300),
                                    );
                                  }
                                });
                              },
                              child: Container(
                                height: 90,
                                width: 90,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/single_point_map.png'), //NetworkImage(imgList[(index) % 5]),
                                      fit: BoxFit.cover),
                                  boxShadow: [
                                    selectedIndex == index
                                        ? BoxShadow(
                                            color: Colors.black45,
                                            //  color: list[new Random().nextInt(5)],
                                            blurRadius:
                                                2.0, // soften the shadow
                                            spreadRadius:
                                                2.0, //extend the shadow
                                            //   offset: Offset(0.0, 1.0)
                                          )
                                        : BoxShadow()
                                  ],
                                ),
                                child: new Container(
                                  decoration: new BoxDecoration(
                                    color: selectedIndex != -1
                                        ? selectedIndex == index
                                            ? Colors.white.withOpacity(0.0)
                                            : Colors.white.withOpacity(0.7)
                                        : Colors.white.withOpacity(0.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                if (selectedIndex != -1)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 13, left: 15, right: 15),
                        child: Text(
                          "Yibe : " + selectedIndex.toString(),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "This very random organisation at this spectacualr venue presents an evening of Jazz. Jazz in India is a avery niche\n\n  => Selected Index ==  " +
                              selectedIndex.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: Text(
                          "Resources",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "This very random organisation at this spectacualr venue presents an evening of Jazz. Jazz in India is a avery niche\n\n  => Selected Index ==  " +
                              selectedIndex.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),

          //============================================================================== Existing work & Progress ==================================

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "Existing work / Progress",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(width: index == 0 ? 15 : 8),
                      Container(
                        height: 120,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                              color: hexToColor("#7280FF"), width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/single_point_map.png'), // NetworkImage(imgList[(index + 2) % 5]),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  );
                }),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: index == 0 ? 15 : 8),
                        Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              // border: Border.all(
                              //     color: hexToColor("#7280FF"), width: 1.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Text(
                            "Icon",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),

          //=============================================================================   Team  ==============================

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "Team",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 90,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(width: index == 0 ? 15 : 20),
                      Container(
                        height: 90,
                        width: 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            // border: Border.all(
                            //     color: hexToColor("#7280FF"), width: 1.5),
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/single_point_map.png'), // NetworkImage(imgList[(index + 3) % 5]),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  );
                }),
          ),
        ],
      );
    }
    return SizedBox();
  }

  //=========================================================================================================================================
  //----------------------------------------------------------------------------Resource, Discription, Rules , Disclaimer For Activity And Sports --------------------------------------
  //==========================================================================================================================================

  _resourse_Disc_Rules() {
    if (type == sports ||
        type == eSports ||
        type == peerLearn ||
        type == socialLearn)
      return Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showResources = !_showResources;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Resources",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: hexToColor("#0CB5BB"))),
                  Spacer(),
                  if (_showResources)
                    SvgPicture.asset("assets/images/arrow_drop_down_open.svg",
                        color: hexToColor("#0CB5BB"), height: 19),
                  if (!_showResources)
                    SvgPicture.asset("assets/images/arrow_drop_down.svg",
                        color: hexToColor("#0CB5BB"), height: 16),
                ],
              ),
            ),
            if (_showResources)
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: a.length > b.length ? a.length : b.length,
                  itemBuilder: (c, index) {
                    print(a.length + b.length);
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          index < a.length
                              ? SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        b.add(a[index]);
                                        a.removeAt(index);
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/dot_icon.svg"),
                                        SizedBox(width: 7),
                                        Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.3,
                                          child: Text(
                                            a[index],
                                            style: TextStyle(fontSize: 15),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                          index < b.length
                              ? SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        a.add(b[index]);
                                        b.removeAt(index);
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/dot_icon.svg"),
                                        SizedBox(width: 7),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: Text(
                                            b[index],
                                            style: TextStyle(
                                              fontSize: 15,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                        ],
                      ),
                    );
                  }),
            Divider(
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showDiscription = !_showDiscription;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Description",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: hexToColor("#0CB5BB"))),
                  Spacer(),
                  if (_showDiscription)
                    SvgPicture.asset("assets/images/arrow_drop_down_open.svg",
                        color: hexToColor("#0CB5BB"), height: 19),
                  if (!_showDiscription)
                    SvgPicture.asset("assets/images/arrow_drop_down.svg",
                        color: hexToColor("#0CB5BB"), height: 16),
                ],
              ),
            ),
            if (_showDiscription)
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "This very random organisation at this spectacualr venue presents an evening of Jazz. Jazz in India is a avery niche interest since most of the indian  think that the genre is flawed like come on bro just let people have some fun. ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            Divider(
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showRules = !_showRules;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Rules",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: hexToColor("#0CB5BB"))),
                  Spacer(),
                  if (_showRules)
                    SvgPicture.asset("assets/images/arrow_drop_down_open.svg",
                        color: hexToColor("#0CB5BB"), height: 19),
                  if (!_showRules)
                    SvgPicture.asset("assets/images/arrow_drop_down.svg",
                        color: hexToColor("#0CB5BB"), height: 16),
                ],
              ),
            ),
            if (_showRules)
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "This very random organisation at this spectacualr venue presents an evening of Jazz. Jazz in India is a avery niche interest since most of the indian  think that the genre is flawed like come on bro just let people have some fun. ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            Divider(
              color: Colors.grey,
            ),
            // GestureDetector(
            //   onTap: () {
            //     setState(() {
            //       _showDisclaimer = !_showDisclaimer;
            //     });
            //   },
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Text("Disclaimer",
            //           style: TextStyle(
            //               fontSize: 25,
            //               fontWeight: FontWeight.w500,
            //               color: hexToColor("#0CB5BB"))),
            //       Spacer(),
            //       SvgPicture.asset("assets/images/arrow_drop_down.svg",
            //           color: hexToColor("#0CB5BB")),
            //     ],
            //   ),
            // ),
            // if (_showDisclaimer)
            //   Container(
            //     margin: EdgeInsets.symmetric(vertical: 10),
            //     width: MediaQuery.of(context).size.width,
            //     child: Text(
            //       "This very random organisation at this spectacualr venue presents an evening of Jazz. Jazz in India is a avery niche interest since most of the indian  think that the genre is flawed like come on bro just let people have some fun. ",
            //       style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 10,
            //           fontWeight: FontWeight.w400),
            //     ),
            //   ),
            // Divider(
            //   color: Colors.grey,
            // ),
          ],
        ),
      );
    return SizedBox();
  }

  //=========================================================================================================================================
  //---------------------------------------------------------------------------------   Disclaimer Function --------------------------------------
  //==========================================================================================================================================

  _disclaimer() {
    String arrowColor;
    String textColor;
    if (type == event ||
        type == internship ||
        type == quickFixes ||
        type == projects) {
      arrowColor = "#7280FF";
      textColor = "#000000";
    } else {
      arrowColor = "#0CB5BB";
      textColor = "#0CB5BB";
    }
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (type == event ||
              type == internship ||
              type == quickFixes ||
              type == projects)
            Divider(
              color: Colors.grey,
            ),
          GestureDetector(
            onTap: () {
              setState(() {
                _showDisclaimer = !_showDisclaimer;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Disclaimer",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: hexToColor(textColor))),
                Spacer(),
                if (_showDisclaimer)
                  SvgPicture.asset("assets/images/arrow_drop_down_open.svg",
                      color: hexToColor(arrowColor), height: 19),
                if (!_showDisclaimer)
                  SvgPicture.asset(
                    "assets/images/arrow_drop_down.svg",
                    color: hexToColor(arrowColor),
                    height: 16,
                  ),
              ],
            ),
          ),
          if (_showDisclaimer)
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "This very random organisation at this spectacualr venue presents an evening of Jazz. Jazz in India is a avery niche interest since most of the indian  think that the genre is flawed like come on bro just let people have some fun. ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
    return SizedBox();
  }

  //=========================================================================================================================================
  //---------------------------------------------------------------------------------   Terms & Conditions --------------------------------------
  //==========================================================================================================================================

  _termsAndConditions() {
    if (type == event)
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _showTermsAndConditions = !_showTermsAndConditions;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Terms & Conditions",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  Spacer(),
                  if (_showTermsAndConditions)
                    SvgPicture.asset("assets/images/arrow_drop_down_open.svg",
                        color: hexToColor("#7280FF"), height: 19),
                  if (!_showTermsAndConditions)
                    SvgPicture.asset("assets/images/arrow_drop_down.svg",
                        color: hexToColor("#7280FF"), height: 16),
                ],
              ),
            ),
            if (_showTermsAndConditions)
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "This very random organisation at this spectacualr venue presents an evening of Jazz. Jazz in India is a avery niche interest since most of the indian  think that the genre is flawed like come on bro just let people have some fun. ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            Divider(
              color: Colors.grey,
            ),
          ],
        ),
      );
    return SizedBox();
  }

  //=========================================================================================================================================
  //---------------------------------------------------------------------------------   BottomBar Function --------------------------------------
  //==========================================================================================================================================

  _bottomBar() {
    return Positioned(
        bottom: 0.0,
        left: 0.0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          alignment: Alignment.centerLeft,
          // color: Colors.white,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5), topLeft: Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                //  color: list[new Random().nextInt(5)],
                blurRadius: 2.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                    0.0, // Move to right 10  horizontally
                    0 // Move to bottom 10 Vertically
                    ),
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5), topLeft: Radius.circular(5)),
            ),
            child: type == event ||
                    type == internship ||
                    type == quickFixes ||
                    type == projects
                ? _rowForEvent_Intern_QuickFix_Project()
                : _rowForActivity_Sports(),
          ),
        ));
  }

  _rowForEvent_Intern_QuickFix_Project() {
    return Row(
      children: [
        if (type != projects)
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: hexToColor("#424283"), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/money.svg'),
                  Text(
                    widget.type == quickFixes
                        ? "${widget.price}"
                        : " Rs. ${widget.price}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: hexToColor("#424283")),
                  ),
                ],
              ),
            ),
          ),
        if (type == projects)
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            width: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: hexToColor("#424283"),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              "Contact",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              _isConformed = !_isConformed;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 10, right: 10, bottom: type == projects ? 10 : 0),
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: _isConformed
                          ? Color(0xFF27AE60)
                          : hexToColor("#424283"),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    child: widget.type == quickFixes
                        ? Text(
                            _isConformed ? "✓" : "Bid",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        : Text(
                            _isConformed ? "Applied" : "Apply",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                  ),
                ),
              ),
              if (type != projects)
                Text(
                  "by 31/10/20",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
              if (type != projects)
                SizedBox(
                  height: 3,
                )
            ],
          ),
        )
      ],
    );
  }

  _rowForActivity_Sports() {
    return Row(
      children: [
        if (type == socialLearn)
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            //  width: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: hexToColor("#157F83"),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              "Teach",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              _isConformed = !_isConformed;
            });
          },
          child: Container(
            margin: EdgeInsets.only(top: 10, right: 10, bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: _isConformed ? Color(0xFF27AE60) : hexToColor("#157F83"),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              type == peerLearn
                  ? "Teach"
                  : _isConformed ? "Request sent" : "Request to join",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        )
      ],
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
