import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yibe_final_ui/models/event.dart';
import 'package:yibe_final_ui/services/eventdatabase.dart';

import '../widget/card.dart';
import 'PageHandler.dart';

class CollegeSectionPage extends StatefulWidget {
  static final routeName = "/CollegeSectionPage";
  final int activepassedvalue;
  const CollegeSectionPage({
    Key key,
    this.activepassedvalue,
  }) : super(key: key);

  @override
  _CollegeSectionPageState createState() => _CollegeSectionPageState();
}

class _CollegeSectionPageState extends State<CollegeSectionPage> {
  var _index = 0;
  ScrollController _controller = ScrollController(initialScrollOffset: 0.1);

  CarouselController buttonCarouselController = CarouselController();
  int activevalueColor;
  int activeMapButton = 0;
  bool isVisible = true;
  bool activeActivity;
  bool activeEvents;
  bool activeGrowth;

  static const List<Text> sublistActivity = [
    Text(
      "All",
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    ),
    Text(
      "Sports",
      style: TextStyle(color: Color(0xff00D09E), fontSize: 20.0),
    ),
    Text(
      "Esports",
      style: TextStyle(color: Color(0xff6197FF), fontSize: 20.0),
    ),
    Text(
      "Skills +",
      style: TextStyle(color: Color(0xffF89E26), fontSize: 20.0),
    ),
    Text(
      "Others",
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    ),
  ];
  static const List<Text> sublistGrowth = [
    Text(
      "All",
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    ),
    Text(
      "QuickFix",
      style: TextStyle(color: Color(0xff00D09E), fontSize: 20.0),
    ),
    Text(
      "Internships",
      style: TextStyle(color: Color(0xff6197FF), fontSize: 20.0),
    ),
    Text(
      "Projects",
      style: TextStyle(color: Color(0xffF89E26), fontSize: 20.0),
    ),
    Text(
      "Others",
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    ),
  ];
  static const List<Text> sublistEvents = [
    Text(
      "All",
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    ),
    Text(
      "College Fests",
      style: TextStyle(color: Color(0xff00D09E), fontSize: 20.0),
    ),
    Text(
      "Music Fest",
      style: TextStyle(color: Color(0xff6197FF), fontSize: 20.0),
    ),
    Text(
      "Parties",
      style: TextStyle(color: Color(0xffF89E26), fontSize: 20.0),
    ),
    Text(
      "Others",
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    ),
  ];
  List<String> list1 = [
    "Events",
    "Growth+",
    "Activity",
  ];

  List<Text> list2;
  List<Text> switchsubList(int value) {
    switch (value) {
      case 0:
        activeActivity = false;
        activeEvents = true;
        activeGrowth = false;

        return sublistEvents;
        break;
      case 1:
        activeActivity = false;
        activeEvents = false;
        activeGrowth = true;

        return sublistGrowth;
        break;
      case 2:
        activeActivity = true;
        activeEvents = false;
        activeGrowth = false;

        return sublistActivity;
        break;
      default:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    activevalueColor = widget.activepassedvalue;
    list2 = switchsubList(widget.activepassedvalue);
  }

  @override
  Widget build(BuildContext context) {
    final CarouselController _crouselController = CarouselController();
    int activeIndex = widget.activepassedvalue;
    //  activevalueColor = widget.activepassedvalue;
    ScrollController _mainController =
        ScrollController(initialScrollOffset: 174.0 * activeIndex);
    void switchMainList(int value, double width) {
      switch (value) {
        case 0:
          print(activevalueColor);
          setState(() {
            activeActivity = false;
            activeEvents = true;
            activeGrowth = false;
            activeIndex = value;
            activevalueColor = value;
            _controller.animateTo(0.0,
                duration: Duration(milliseconds: 700), curve: Curves.linear);
            buttonCarouselController.nextPage();
            //   buttonCarouselController.jumpToPage(2);
            // _mainController.animateTo(width * value,
            //     duration: Duration(milliseconds: 700), curve: Curves.linear);
            list2 = sublistEvents;
          });
          print(activevalueColor);
          break;
        case 1:
          setState(() {
            activeActivity = false;
            activeEvents = false;
            activeGrowth = true;
            activeIndex = 1;
            activevalueColor = value;
            _controller.animateTo(0.0,
                duration: Duration(milliseconds: 700), curve: Curves.linear);
            // _mainController.animateTo(width * value,
            //     duration: Duration(milliseconds: 700), curve: Curves.linear);
            list2 = sublistGrowth;
          });
          break;
        case 2:
          setState(() {
            activeActivity = true;
            activeEvents = false;
            activeGrowth = false;
            activeIndex = 2;
            activevalueColor = value;
            _controller.animateTo(0.0,
                duration: Duration(milliseconds: 700), curve: Curves.linear);
            // _mainController.animateTo(width * value,
            //     duration: Duration(milliseconds: 700), curve: Curves.linear);

            list2 = sublistActivity;
          });
          break;

        default:
          break;
      }
    }

    // switchMainList(activeIndex , 204.0);
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
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30.0,
                        )),
                    Spacer(),
                    SizedBox(
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
        ),
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  //     mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        //   color: Colors.red,
                        height: 50,
                        child: CarouselSlider(
                            carouselController: _crouselController,
                            options: CarouselOptions(
                                enableInfiniteScroll: true,
                                autoPlay: false,
                                initialPage: 0,
                                viewportFraction: 0.5),
                            items: list1.map((card) {
                              // ListView.builder(
                              //   shrinkWrap: true,
                              //      key: new Key('1234'),
                              //   reverse: false,
                              // //  primary: true,
                              //     controller: _mainController,
                              //     scrollDirection: Axis.horizontal,
                              //   itemCount: 3,
                              //     // itemBuilder: (context, index) {
                              //   var item = list1[index];
                              return GestureDetector(
                                onTap: () {
                                  _crouselController.nextPage();
                                  print('tap');
                                  //   print(index);
                                  //    buttonCarouselController.jumpToPage(1);
                                  //print(activeIndex);
                                  //  print(activevalueColor);
                                  switchMainList(list1.indexOf(card), 174.0);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 16.0),
                                  child: Container(
                                      width: 150,
                                      child: Text(
                                        card,
                                        style: TextStyle(
                                            fontSize: 42.0,
                                            //color: Colors.red
                                            color: activevalueColor ==
                                                    list1.indexOf(card)
                                                ? Color(0xff008294)
                                                : Color(0xff008294)
                                                    .withOpacity(0.5)),
                                      )),
                                ),
                              );
                            }).toList()

                            /// })),
                            )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      height: 40,
                      child: Row(
                        children: [
                          Container(
                              width: 40.0,
                              child: IconButton(
                                icon: Icon(Icons.local_bar),
                                onPressed: () {
                                  _controller.jumpTo(0.0);
                                },
                                color: Color(0xff12ACB1),
                              )),
                          Expanded(
                            child: ListView.builder(
                                //  key: ObjectKey(list2[0]),
                                controller: _controller,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: list2.length,
                                itemBuilder: (context, index) {
                                  var item = list2[index];
                                  return FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisible = !isVisible;
                                        });
                                      },
                                      child: item);
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            left: 15,
                          ),
                          child: SvgPicture.asset(
                            'assets/images/add_btn.svg',
                            width: 24.0,
                            height: 24.0,
                            color: Color(0xff12ACB1),
                          ),
                          // child: Text(
                          //   '+ADD',
                          //   style: TextStyle(
                          //       color: Color(0xff12ACB1), fontSize: 30.0),
                          // )
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ButtonTheme(
                                height: 30.0,
                                minWidth: 20,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Color(0xff12ACB1),
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0))),
                                  onPressed: () {
                                    setState(() {
                                      activeMapButton = 0;
                                    });
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    size: 20.0,
                                    color: activeMapButton == 0
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  color: activeMapButton == 0
                                      ? Color(0xff12ACB1)
                                      : Colors.white,
                                ),
                              ),
                              ButtonTheme(
                                height: 30.0,
                                minWidth: 20,
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      activeMapButton = 1;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Color(0xff12ACB1),
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0))),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 20.0,
                                    color: activeMapButton == 1
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  color: activeMapButton == 1
                                      ? Color(0xff12ACB1)
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    StreamBuilder<List<Event>>(
                        stream: EventDatabaseService().getEvents(0),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return StreamBuilder<EventDetails>(
                                    stream: EventDatabaseService()
                                        .getEventDetails(
                                            snapshot.data[index].eventId),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Visibility(
                                          visible: activeActivity,
                                          child: BaseCard(
                                            type: 1,
                                            pathOfimg:
                                                'assets/images/activity_card.png',
                                            title: snapshot.data.eventName,
                                            totalNoofparticipation: 100,
                                            noOfPeopleparticipated: 10,
                                            tags: [
                                              'rich',
                                              'computer Engineer',
                                              'hello'
                                            ],
//                                        date: '31st Mar \'20',
                                            date: snapshot.data.dateOfEvent,
                                            time: snapshot.data.timeOfEvent,
                                            location: snapshot.data.address,
                                            organiser: 'Delhi Public School',
                                            price: 500,
                                            jobTitle: 'Job Title',
                                            jobDuration: '12 weeks',
                                            projectDetail: [
                                              'a',
                                              'b',
                                              'c',
                                              'd',
                                              'e',
                                              'f'
                                            ],
                                            organiserId: 'abc',
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    });
                              },
                            );
                          } else {
                            return Container();
                          }
                        }),
//                    ListView(
//                      physics: NeverScrollableScrollPhysics(),
//                      shrinkWrap: true,
//                      scrollDirection: Axis.vertical,
//                      children: [
//                        Visibility(
//                          visible: activeActivity,
//                          child: BaseCard(
//                            type: 1,
//                            pathOfimg: 'assets/images/activity_card.png',
//                            title: 'Event Card',
//                            totalNoofparticipation: 100,
//                            noOfPeopleparticipated: 10,
//                            tags: ['rich', 'computer Engineer', 'hello'],
//                            date: '31st Mar \'20',
//                            time: '24:24 PM',
//                            location: 'location',
//                            organiser: 'Delhi Public School',
//                            price: 500,
//                            jobTitle: 'Job Title',
//                            jobDuration: '12 weeks',
//                            projectDetail: ['a', 'b', 'c', 'd', 'e', 'f'],
//                            organiserId: 'abc',
//                          ),
//                        ),
//                        Visibility(
//                          visible: activeActivity,
//                          child: BaseCard(
//                            type: 1,
//                            pathOfimg: 'assets/images/activity_card.png',
//                            title: 'Event Card',
//                            totalNoofparticipation: 100,
//                            noOfPeopleparticipated: 10,
//                            tags: ['rich', 'computer Engineer', 'hello'],
//                            date: '31st Mar \'20',
//                            time: '24:24 PM',
//                            location: 'location',
//                            organiser: 'Delhi Public School',
//                            price: 500,
//                            jobTitle: 'Job Title',
//                            jobDuration: '12 weeks',
//                            projectDetail: ['a', 'b', 'c', 'd', 'e', 'f'],
//                            organiserId: 'abc',
//                          ),
//                        ),
//                        Visibility(
//                          visible: activeActivity,
//                          child: BaseCard(
//                            type: 1,
//                            pathOfimg: 'assets/images/activity_card.png',
//                            title: 'Event Card',
//                            totalNoofparticipation: 100,
//                            noOfPeopleparticipated: 10,
//                            tags: ['rich', 'computer Engineer', 'hello'],
//                            date: '31st Mar \'20',
//                            time: '24:24 PM',
//                            location: 'location',
//                            organiser: 'Delhi Public School',
//                            price: 500,
//                            jobTitle: 'Job Title',
//                            jobDuration: '12 weeks',
//                            projectDetail: ['a', 'b', 'c', 'd', 'e', 'f'],
//                            organiserId: 'abc',
//                          ),
//                        ),
//                        Visibility(
//                          visible: activeActivity,
//                          child: BaseCard(
//                            type: 1,
//                            pathOfimg:
//                                'assets/images/activity_college_section_page.png',
//                            title: 'Event Card',
//                            totalNoofparticipation: 100,
//                            noOfPeopleparticipated: 10,
//                            tags: ['rich', 'computer Engineer', 'hello'],
//                            date: '31st Mar \'20',
//                            time: '24:24 PM',
//                            location: 'location',
//                            organiser: 'Delhi Public School',
//                            price: 500,
//                            jobTitle: 'Job Title',
//                            jobDuration: '12 weeks',
//                            projectDetail: ['a', 'b', 'c', 'd', 'e', 'f'],
//                            organiserId: 'abc',
//                          ),
//                        ),
//                        Visibility(
//                          visible: activeGrowth,
//                          child: BaseCard(
//                            type: 1,
//                            pathOfimg: 'assets/images/growth_card.png',
//                            title: 'Event Card',
//                            totalNoofparticipation: 100,
//                            noOfPeopleparticipated: 10,
//                            tags: ['rich', 'computer Engineer', 'hello'],
//                            date: '31st Mar \'20',
//                            time: '24:24 PM',
//                            location: 'location',
//                            organiser: 'Delhi Public School',
//                            price: 500,
//                            jobTitle: 'Job Title',
//                            jobDuration: '12 weeks',
//                            projectDetail: ['a', 'b', 'c', 'd', 'e', 'f'],
//                            organiserId: 'abc',
//                          ),
//                        ),
//                        Visibility(
//                          visible: activeGrowth,
//                          child: BaseCard(
//                            type: 1,
//                            pathOfimg: 'assets/images/growth_card.png',
//                            title: 'Event Card',
//                            totalNoofparticipation: 100,
//                            noOfPeopleparticipated: 10,
//                            tags: ['rich', 'computer Engineer', 'hello'],
//                            date: '31st Mar \'20',
//                            time: '24:24 PM',
//                            location: 'location',
//                            organiser: 'Delhi Public School',
//                            price: 500,
//                            jobTitle: 'Job Title',
//                            jobDuration: '12 weeks',
//                            projectDetail: ['a', 'b', 'c', 'd', 'e', 'f'],
//                            organiserId: 'abc',
//                          ),
//                        ),
//                        Visibility(
//                          visible: activeGrowth,
//                          child: BaseCard(
//                            type: 1,
//                            pathOfimg: 'assets/images/growth_card.png',
//                            title: 'Event Card',
//                            totalNoofparticipation: 100,
//                            noOfPeopleparticipated: 10,
//                            tags: ['rich', 'computer Engineer', 'hello'],
//                            date: '31st Mar \'20',
//                            time: '24:24 PM',
//                            location: 'location',
//                            organiser: 'Delhi Public School',
//                            price: 500,
//                            jobTitle: 'Job Title',
//                            jobDuration: '12 weeks',
//                            projectDetail: ['a', 'b', 'c', 'd', 'e', 'f'],
//                            organiserId: 'abc',
//                          ),
//                        ),
//                        Visibility(
//                          visible: activeGrowth,
//                          child: BaseCard(
//                            type: 1,
//                            pathOfimg: 'assets/images/growth_card.png',
//                            title: 'Event Card',
//                            totalNoofparticipation: 100,
//                            noOfPeopleparticipated: 10,
//                            tags: ['rich', 'computer Engineer', 'hello'],
//                            date: '31st Mar \'20',
//                            time: '24:24 PM',
//                            location: 'location',
//                            organiser: 'Delhi Public School',
//                            price: 500,
//                            jobTitle: 'Job Title',
//                            jobDuration: '12 weeks',
//                            projectDetail: ['a', 'b', 'c', 'd', 'e', 'f'],
//                            organiserId: 'abc',
//                          ),
//                        ),
//                        Visibility(
//                          visible: activeGrowth,
//                          child: BaseCard(
//                            type: 1,
//                            pathOfimg: 'assets/images/growth_card.png',
//                            title: 'Event Card',
//                            totalNoofparticipation: 100,
//                            noOfPeopleparticipated: 10,
//                            tags: ['rich', 'computer Engineer', 'hello'],
//                            date: '31st Mar \'20',
//                            time: '24:24 PM',
//                            location: 'location',
//                            organiser: 'Delhi Public School',
//                            price: 500,
//                            jobTitle: 'Job Title',
//                            jobDuration: '12 weeks',
//                            projectDetail: ['a', 'b', 'c', 'd', 'e', 'f'],
//                            organiserId: 'abc',
//                          ),
//                        ),
//                        Visibility(
//                          visible: activeEvents,
//                          child: BaseCard(
//                            type: 1,
//                            pathOfimg: 'assets/images/500_startups_events.png',
//                            title: 'Start-up 101',
//                            totalNoofparticipation: 245,
//                            //    noOfPeopleparticipated: 10,
//                            tags: ['Start-Up', 'How'],
//                            date: '31st Oct \'20',
//                            time: '10:30 AM',
//                            location: 'BT Kawde Road, Pune',
//                            organiser: 'Delhi Public School,Pune',
//                            price: 500,
//                            // jobTitle: 'Job Title',
//                            // jobDuration: '12 weeks',
//                            // projectDetail: ['a','b','c','d','e','f'],
//                            // organiserId: 'abc',
//                          ),
//                        ),
//                        // Visibility(
//                        //   visible: activeEvents,
//                        //                 child: BaseCard(
//
//                        //     type : 1,
//                        //     pathOfimg: 'assets/images/500_startups_events.png',
//                        //     title: 'Start-up 101',
//                        //     totalNoofparticipation: 245,
//                        // //    noOfPeopleparticipated: 10,
//                        //     tags: ['Start-Up','How'],
//                        //     date: '31st Oct \'20',
//                        //     time: '10:30 AM',
//                        //     location: 'BT Kawde Road, Pune',
//                        //     organiser: 'Delhi Public School,Pune',
//                        //     price: 500,
//                        //     // jobTitle: 'Job Title',
//                        //     // jobDuration: '12 weeks',
//                        //     // projectDetail: ['a','b','c','d','e','f'],
//                        //     // organiserId: 'abc',
//                        //   ),
//                        // ),
//                        Visibility(
//                          visible: activeEvents,
//                          child: BaseCard(
//                            type: 1,
//                            pathOfimg: 'assets/images/Re_live_music_events.png',
//                            title: 'Re-Live Music',
//                            totalNoofparticipation: 145,
//                            //    noOfPeopleparticipated: 10,
//                            tags: ['Music', 'Re-Live', "80s"],
//                            date: '24th Oct \'20',
//                            time: '08:24 PM',
//                            location: 'Katraj, Pune',
//                            organiser: 'Music Org, Pune',
//                            price: 1500,
//                            // jobTitle: 'Job Title',
//                            // jobDuration: '12 weeks',
//                            // projectDetail: ['a','b','c','d','e','f'],
//                            // organiserId: 'abc',
//                          ),
//                        ),
//                        Visibility(
//                          visible: activeEvents,
//                          child: BaseCard(
//                            type: 1,
//                            pathOfimg: 'assets/images/poolparty_events.png',
//                            title: 'Pool Party',
//                            totalNoofparticipation: 26,
//                            //    noOfPeopleparticipated: 10,
//                            tags: ['Pool', 'Party'],
//                            date: '30th Oct \'20',
//                            time: '06:30 PM',
//                            location: 'Koregaon Park, Pune',
//                            organiser: 'Classy Events',
//                            price: 750,
//                            // jobTitle: 'Job Title',
//                            // jobDuration: '12 weeks',
//                            // projectDetail: ['a','b','c','d','e','f'],
//                            // organiserId: 'abc',
//                          ),
//                        ),
//                        // Visibility(
//                        //   visible: activeEvents,
//                        //                 child: BaseCard(
//                        //     type : 1,
//                        //     organiserId: 'abc',
//                        //     pathOfimg: 'assets/images/event_pic.png',
//                        //     title: 'Internship',
//                        //     totalNoofparticipation: 100,
//                        //     noOfPeopleparticipated: 10,
//                        //     tags: ['rich','computer Engineer','hello'],
//                        //     date: '31st Mar \'20',
//                        //     time: '24:24 PM',
//                        //     location: 'locationasfsfadfdgdgsdgsgfdhhdf',
//                        //     organiser: 'Delhi Public School',
//                        //     price: 500,
//                        //     jobTitle: 'Job ',
//                        //     jobDuration: '12 weeks',
//                        //     projectDetail: ['a','b','c','d','e','f'],
//                        //   ),
//                        // ),
//                        // Visibility(
//                        //   visible: activeEvents,
//                        //                 child: BaseCard(
//                        //     organiserId: 'abc',
//                        //     type : 3,
//                        //     pathOfimg: 'assets/images/event_pic.png',
//                        //     title: 'QuickFix',
//                        //     totalNoofparticipation: 100,
//                        //     noOfPeopleparticipated: 10,
//                        //     tags: ['rich','computer Engineer','hello'],
//                        //     date: '31st Mar \'20',
//                        //     time: '24:24 PM',
//                        //     location: 'location',
//                        //     organiser: 'Delhi Public School',
//                        //     price: 500,
//                        //     jobTitle: 'Job Title',
//                        //     jobDuration: '12 weeks',
//                        //     projectDetail: ['a','b','c','d','e','f'],
//                        //   ),
//                        // ),
//                        // Visibility(
//                        //   visible: activeEvents,
//                        //                 child: BaseCard(
//                        //     organiserId: 'abc',
//                        //     type : 4,
//                        //     pathOfimg: 'assets/images/event_pic.png',
//                        //     title: 'Projects',
//                        //     totalNoofparticipation: 100,
//                        //     noOfPeopleparticipated: 10,
//                        //     tags: ['rich','computer Engineer','hello'],
//                        //     date: '31st Mar \'20',
//                        //     time: '24:24 PM',
//                        //     location: 'location',
//                        //     organiser: 'Delhi Public School',
//                        //     price: 500,
//                        //     jobTitle: 'Job Title',
//                        //     jobDuration: '12 weeks',
//                        //     projectDetail: ['a','b','c','d','e','f'],
//                        //     workingPhase : 2,
//                        //   ),
//                        // ),
//                        //  Visibility(
//                        //   visible: activeEvents,
//                        //                 child: BaseCard(
//                        //     type : 5,
//                        //     organiserId: 'abc',
//                        //     pathOfimg: 'assets/images/event_pic.png',
//                        //     title: 'Sports',
//                        //     totalNoofparticipation: 100,
//                        //     noOfPeopleparticipated: 10,
//                        //     tags: ['rich','computer Engineer','hello'],
//                        //     date: '31st Mar \'20',
//                        //     time: '24:24 PM',
//                        //     location: 'location',
//                        //     organiser: 'Delhi Public School',
//                        //     price: 500,
//                        //     jobTitle: 'Job Title',
//                        //     jobDuration: '12 weeks',
//                        //     projectDetail: ['a','b','c','d','e','f'],
//                        //   ),
//                        // ),
//                        // Visibility(
//                        //   visible: activeEvents,
//                        //                 child: BaseCard(
//                        //     type : 6,
//                        //     organiserId: 'abc',
//                        //     pathOfimg: 'assets/images/event_pic.png',
//                        //     title: 'e-Sports',
//                        //     totalNoofparticipation: 100,
//                        //     noOfPeopleparticipated: 10,
//                        //     tags: ['rich','computer Engineer','hello'],
//                        //     date: '31st Mar \'20',
//                        //     time: '24:24 PM',
//                        //     location: 'location',
//                        //     organiser: 'Delhi Public School',
//                        //     price: 500,
//                        //     jobTitle: 'Job Title',
//                        //     jobDuration: '12 weeks',
//                        //     projectDetail: ['a','b','c','d','e','f'],
//                        //   ),
//                        // ),
//                        //  Visibility(
//                        //   visible: activeEvents,
//                        //                 child: BaseCard(
//                        //     type : 7,
//                        //     organiserId: 'abc',
//                        //     pathOfimg: 'assets/images/event_pic.png',
//                        //     title: 'Others',
//                        //     totalNoofparticipation: 100,
//                        //     noOfPeopleparticipated: 10,
//                        //     tags: ['rich','computer Engineer','hello'],
//                        //     date: '31st Mar \'20',
//                        //     time: '24:24 PM',
//                        //     location: 'location',
//                        //     organiser: 'Delhi Public School',
//                        //     price: 500,
//                        //     jobTitle: 'Job Title',
//                        //     jobDuration: '12 weeks',
//                        //     projectDetail: ['a','b','c','d','e','f'],
//                        //   ),
//                        // ),
//                        // Visibility(
//                        //   visible: activeEvents,
//                        //                 child: BaseCard(
//                        //     organiserId: 'abc',
//                        //     type : 8,
//                        //     pathOfimg: 'assets/images/event_pic.png',
//                        //     title: 'Peer Learning',
//                        //     totalNoofparticipation: 100,
//                        //     noOfPeopleparticipated: 10,
//                        //     tags: ['rich','computer Engineer','hello'],
//                        //     date: '31st Mar \'20',
//                        //     time: '24:24 PM',
//                        //     location: 'location',
//                        //     organiser: 'Delhi Public School',
//                        //     price: 500,
//                        //     jobTitle: 'Job Title',
//                        //     jobDuration: '12 weeks',
//                        //     projectDetail: ['a','b','c','d','e','f'],
//                        //   ),
//                        // ),
//                        // Visibility(
//                        //   visible: activeEvents,
//                        //                 child: BaseCard(
//                        //     organiserId: 'abc',
//                        //     type : 9,
//                        //     pathOfimg: 'assets/images/event_pic.png',
//                        //     title: 'Social Learn',
//                        //     totalNoofparticipation: 100,
//                        //     noOfPeopleparticipated: 10,
//                        //     tags: ['rich','computer Engineer','hello'],
//                        //     date: '31st Mar \'20',
//                        //     time: '24:24 PM',
//                        //     location: 'location',
//                        //     organiser: 'Delhi Public School',
//                        //     price: 500,
//                        //     jobTitle: 'Job Title',
//                        //     jobDuration: '12 weeks',
//                        //     projectDetail: ['a','b','c','d','e','f'],
//                        //   ),
//                        // ),
//                      ],
//                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}

class BottomList extends StatelessWidget {
  final List<Text> list2;
  final ScrollController scrollController;

  BottomList({Key key, this.list2, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 40.0,
            child: IconButton(
              icon: Icon(Icons.local_bar),
              onPressed: () {
                scrollController.jumpTo(0.0);
              },
              color: Color(0xff12ACB1),
            )),
        Expanded(
          child: ListView.builder(
              //  key: ObjectKey(list2[0]),
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: list2.length,
              itemBuilder: (context, index) {
                var item = list2[index];
                return FlatButton(onPressed: () {}, child: item);
              }),
        ),
      ],
    );
  }
}
