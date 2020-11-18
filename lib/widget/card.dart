import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dynamic_detail.dart';

double screenWidth;
final event = "Events Details";
final internship = "Internship";
final quickFixes = "QuickFixes";
final projects = "projects";
final sports = "Activity Sports";
final peerLearn = "Activity Skills+(Peer Learn)";
final socialLearn = "Activity Skills+(Social Learn)";
final eSports = "Activity ESports Online";

// 1-event , 2-internships ,3-small job,4-project,5-sports,6-e sports,7-peerlearning,8-social learning
class BaseCard extends StatefulWidget {
  final List projectDetail;
  final int type,
      noOfPeopleparticipated,
      price,
      totalNoofparticipation,
      workingPhase;
  final String pathOfimg,
      title,
      location,
      date,
      time,
      jobTitle,
      jobDuration,
      organiser,
      organiserId;
  final List<String> tags;
  const BaseCard({
    this.pathOfimg,
    this.title,
    this.noOfPeopleparticipated,
    this.location,
    this.date,
    this.time,
    this.jobTitle,
    this.jobDuration,
    this.tags,
    this.organiser,
    this.organiserId,
    this.price,
    this.totalNoofparticipation,
    this.type,
    this.projectDetail,
    this.workingPhase,
  });
  @override
  _BaseCardState createState() => _BaseCardState();
}

class _BaseCardState extends State<BaseCard> {
  @override
  Widget build(BuildContext context) {
    screenWidth = (MediaQuery.of(context).size.width) * 0.95;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.fromLTRB(8.0, 8.0, 6.0, 11.0),
        width: screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: shadowColor(widget.type),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          // main column
          children: [
            Row(// for image and protion of right side of images
                children: [
              Container(
                height: 100.0,
                width: 100.0,
                child: Image.asset(widget.pathOfimg),
              ), //Image show
              SizedBox(width: 8.0),
              SizedBox(
                width: screenWidth - 120,
                height: 100.0,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // for name and info
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleAndParticipation(
                        widget.type,
                        widget.title,
                        widget.noOfPeopleparticipated,
                        widget.totalNoofparticipation),
                    // SizedBox(height: 3.0),
                    widget.type == 2
                        ? SizedBox(
                            width: screenWidth - 118,
                            child: Text(
                              widget.jobTitle,
                              overflow: TextOverflow.ellipsis,
                              style: textstyle(20.0, Colors.black),
                            ),
                          )
                        : SizedBox(
                            height: 50.0,
                            width: screenWidth - 118,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.tags.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Center(
                                      child: Text('#${widget.tags[index]}',
                                          style: textstyle(
                                              16.0, Color(0xff12ACB1))),
                                    ),
                                    SizedBox(width: 10.0),
                                  ],
                                );
                              },
                            ),
                          ),
                    // SizedBox(height: 8.0),
                    datetimeRow(widget.type, widget.date, widget.time,
                        widget.projectDetail, widget.workingPhase),
                  ],
                ),
              ),
            ]),
            SizedBox(height: 12.0),
            Row(
              // location
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/location_logo.svg',
                      width: 14.0,
                      height: 20.0,
                      color: (widget.type == 3 || widget.type == 4)
                          ? Color(0xFF424283)
                          : Color(0xFF157F83),
                    ),
                    SizedBox(width: 4.0),
                    Container(
                      width: 150.0,
                      child: Text(
                        widget.type == 6 ? 'Online' : widget.location,
                        overflow: TextOverflow.ellipsis,
                        style: textstyle(16.0, Colors.grey),
                      ),
                    ),
                  ],
                ),
                (widget.type == 2 || widget.type == 3)
                    ? Row(
                        children: [
                          Container(
                            width: 24.0,
                            height: 24.0,
                            child: SvgPicture.asset(
                                'assets/images/timer_logo.svg'),
                          ),
                          SizedBox(width: 12.0),
                          Container(
                            width: 150.0,
                            child: Text(
                              widget.jobDuration,
                              overflow: TextOverflow.ellipsis,
                              style: textstyle(18.0, Colors.black),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
            bottomRow(
                widget.type,
                widget.price,
                widget.organiser,
                widget.jobDuration,
                widget.organiserId,
                context,
                widget.pathOfimg,
                widget.tags,
                widget.price.toString(),
                widget.date,
                widget.time,
                widget.title,
                widget.totalNoofparticipation,
                widget.location),
          ],
        ),
      ),
    );
  }
}

Color shadowColor(int type) {
  if (type == 1 || type == 5 || type == 6 || type == 7 || type == 3) {
    return Color(0xFF10D3A4);
  } else if (type == 8 || type == 9 || type == 2) {
    return Color(0xFFF9AA41);
  } else {
    return Colors.white;
  }
}

TextStyle textstyle(double size, Color txtColor) {
  return TextStyle(
    color: txtColor,
    fontSize: size,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
}

Widget titleAndParticipation(int type, String title, int noOfPeopleParticipated,
    int totalNoofParticipates) {
  if (type == 1 || type == 4) {
    return SafeArea(
      child: SizedBox(
        width: screenWidth - 120,
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.3,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: textstyle(20.0, Colors.black),
              ),
            ),
            Spacer(),
            SafeArea(
              child: SvgPicture.asset(
                'assets/images/people_logo.svg',
                width: 24.0,
                height: 12.0,
                color: type == 1 ? Color(0xFF157F83) : Color(0xFF424283),
              ),
            ),
            SizedBox(width: 5.0),
            Text(totalNoofParticipates.toString(),
                style: textstyle(
                    16, type == 1 ? Color(0xFF157F83) : Color(0xFF424283))),
          ],
        ),
      ),
    );
  } else if (type == 5 || type == 6 || type == 7 || type == 9) {
    String participated = noOfPeopleParticipated.toString();
    String total = totalNoofParticipates.toString();
    return SizedBox(
      width: screenWidth - 120,
      child: Row(
        children: [
          SizedBox(
            width: screenWidth * 0.3,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: textstyle(20.0, Colors.black),
            ),
          ),
          Spacer(),
          SvgPicture.asset(
            'assets/images/people_logo.svg',
            width: 24.0,
            height: 12.0,
            color: Color(0xFF157F83),
          ),
          SizedBox(width: 5.0),
          Text('$participated/$total',
              style: textstyle(18.0, Color(0xFF157F83))),
        ],
      ),
    );
  } else {
    return SizedBox(
      width: screenWidth - 120,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: textstyle(20.0, Colors.black),
      ),
    );
  }
}

Widget datetimeRow(
    int type, String date, String time, List projectDetail, int workingPhase) {
  return type == 4
      ? SizedBox(
          width: screenWidth - 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              circulerProjectDetails(projectDetail[0], 1, workingPhase),
              circulerProjectDetails(projectDetail[1], 2, workingPhase),
              circulerProjectDetails(projectDetail[2], 3, workingPhase),
              circulerProjectDetails(projectDetail[3], 4, workingPhase),
              circulerProjectDetails(projectDetail[4], 5, workingPhase),
              circulerProjectDetails(projectDetail[5], 6, workingPhase),
            ],
          ),
        )
      : SizedBox(
          width: screenWidth - 125,
          child: Row(
            // for date and time
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (type == 1)
                SvgPicture.asset(
                  'assets/images/play_logo.svg',
                  width: 20.0,
                  height: 20.0,
                )
              else
                SvgPicture.asset(
                  'assets/images/Calender_End.svg',
                  width: 20.0,
                  height: 20.0,
                ),
              SizedBox(width: 2.0),
              Container(
                width: 195.0,
                child: type == 2
                    ? Text(
                        '$date',
                        style: textstyle(12.0, Colors.black),
                      )
                    : Text(
                        '$date| $time',
                        style: textstyle(12.0, Colors.black),
                      ),
              ),
            ],
          ),
        );
}

Widget bottomRow(
    int type,
    int pay,
    String oraniserName,
    String duration,
    String orgId,
    BuildContext context,
    String pathofimg,
    List<String> tags,
    String price,
    String date,
    String time,
    String title,
    int totalNoofparticipation,
    String location) {
  if (type == 1) {
    return Row(
      // price
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 13.0),
          child: Text(
            'By $oraniserName',
            style: textstyle(10.0, Colors.black),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigator.push(context, MessageAnimation( exitPage: WhiteScreen(), enterPage:DynamicDetails(type: event  , image: pathofimg, tags:tags , price:price , date:date ,time: time, title: title, totalNoofparticipation :1 , location: location,)));
            // Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child:  DynamicDetails(type: event )));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DynamicDetails(type: event)));
          },
          child: Container(
            width: 119.0,
            height: 36.0,
            decoration: BoxDecoration(
              color: Color(0xFF157F83),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                'Rs. $pay',
                style: textstyle(18.0, Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  } else if (type == 2 || type == 3) {
    return Row(
      // price
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 24.0,
              height: 24.0,
              child: SvgPicture.asset('assets/images/Rupee_logo.svg'),
            ),
            SizedBox(width: 12.0),
            Text(
              type == 2 ? 'Rs. $pay' : 'Rs. $pay/hr',
              style: textstyle(18.0, Colors.black),
            ),
          ],
        ),
        bottomButton(type, 119.0, Color(0xFF424283), () {
          //   Navigator.push(context, MessageAnimation( exitPage: WhiteScreen(), enterPage:DynamicDetails(type:  type == 2 ? internship  : quickFixes )));

          // Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child:  DynamicDetails(type:  type == 2 ? internship  : quickFixes  )));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DynamicDetails(
                      type: type == 2 ? internship : quickFixes)));
        }),
      ],
    );
  } else if (type == 5 || type == 6 || type == 7 || type == 8 || type == 9) {
    return Row(
      // price
      children: [
        Padding(
          padding: EdgeInsets.only(top: 13.0),
          child: Text(
            'By $oraniserName',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(width: 8.0),
        Padding(
          padding: EdgeInsets.only(top: 13.0),
          child: Text(
            '@$orgId',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10.0,
              color: Color(0xFFA7A7A7),
            ),
          ),
        ),
        Spacer(),
        bottomButton(type, 155.0, Color(0xFF157F83), () {
          //  Navigator.push(context,  MessageAnimation( exitPage: WhiteScreen(), enterPage:DynamicDetails(
          //  type:  type == 5 ? sports :  type == 6 ? eSports :  type == 8 ?  peerLearn : socialLearn ,
          //  )));
          //  Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child:  DynamicDetails(
          //     type:  type == 5 ? sports :  type == 6 ? eSports :  type == 8 ?  peerLearn : socialLearn ,
          //     )));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DynamicDetails(
                        type: type == 5
                            ? sports
                            : type == 6
                                ? eSports
                                : type == 8
                                    ? peerLearn
                                    : socialLearn,
                      )));
        }),
      ],
    );
  } else if (type == 4) {
    return SizedBox(
      width: screenWidth,
      child: Row(
        // price
        children: [
          Spacer(),
          bottomButton(type, 155.0, Color(0xFF424283), () {
            //     Navigator.push(context, MessageAnimation( exitPage: WhiteScreen(), enterPage:DynamicDetails(type: projects )));
            //  Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child:  DynamicDetails(type: projects  )));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DynamicDetails(type: projects)));
          }),
        ],
      ),
    );
  }
}

Widget circulerProjectDetails(String txt, int number, int workingPhase) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          color: workingPhase >= number ? Color(0xFF7280FF) : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Color(0xFF7280FF), width: 1.0),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: textstyle(20.0,
                workingPhase >= number ? Colors.white : Color(0xFF7280FF)),
          ),
        ),
      ),
      SizedBox(
        width: 42.0,
        height: 18.0,
        child: Center(
          child: Text(
            txt,
            style: textstyle(6.0, Color(0xFF7280FF)),
          ),
        ),
      ),
    ],
  );
}

Widget bottomButton(
    int type, double btnWidth, Color btnColor, Function onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: btnWidth,
      height: 36.0,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          type == 4
              ? 'More Details'
              : (type == 2 || type == 3)
                  ? 'Apply'
                  : (type == 8 || type == 9)
                      ? 'Send Request'
                      : 'Request to Join',
          style: textstyle(18.0, Colors.white),
        ),
      ),
    ),
  );
}

class WhiteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
      ),
    );
  }
}
