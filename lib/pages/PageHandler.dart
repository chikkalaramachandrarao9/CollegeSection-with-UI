import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yibe_final_ui/pages/Explore.dart';
import 'package:yibe_final_ui/pages/Gallery.dart';
import 'package:yibe_final_ui/pages/Home.dart';
import 'package:yibe_final_ui/pages/Profile.dart';

import 'College.dart';

class PageHandler extends StatefulWidget {
  @override
  _PageHandlerState createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler>
    with TickerProviderStateMixin {
  //var stream;
  // Properties & Variables needed
  int currentTab = 1; // to keep track of active tab index
  final List<Widget> screens = [
    Home(),
    College(),
    Profile(),
    Explore()
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen; // if user taOur first view in viewport
  bool showSheet = false;

  var height;
  bool pressed = false;
  double i = 0;
  // bool _isVisibale = true;

  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen;
  double _panelHeightClosed = 260;
  double _oldHeight = 230;
  double _newHeight = 230;
  PanelController _pc = new PanelController();

  bool _showHyberPOPUP = false;
  bool _showPostFilterPOPUP = false;
  bool _showAddSkillsPopup = false;
  bool _showAddInterestPOPUP = false;
  bool _showLearnSomethingNewPOPUP = false;
  bool _showStartProjectPOPUP = false;
  bool _hyberActivated = false;

  bool _allSelected = false;
  bool _friendsSelected = false;
  bool _closeFriendsSelected = false;
  bool _acquaintanceSelected = false;
  bool _trendingSelected = false;

  @override
  void initState() {
    // stream = FirebaseFirestore.instance
    //     .collection("Demo")
    //     .doc("Card Notification")
    //     .snapshots();
    currentScreen = College(
        //     hiberPopUp: _hyberPOPUP,
        ); // if user ta
    _fabHeight = _initFabHeight;
    super.initState();
  }

  // _hyberPOPUP(value) {
  //   setState(() {
  //     _showHyberPOPUP = value;
  //   });
  // }

  // _hyberActivation(value) {
  //   setState(() {
  //     _hyberActivated = value;
  //     currentScreen = Home(
  //       hiberPopUp: _hyberPOPUP,
  //     );
  //     currentTab = 0;
  //   });
  // }

  // _setCurrentScreen(page) {
  //   setState(() {
  //     currentScreen = HyberNationScreen(
  //       hyberActivation: _hyberActivation,
  //     );
  //     currentTab = 6;
  //     _hyberActivated = true;
  //     _showHyberPOPUP = false;
  //   });
  // }

  // _postFilterPOPUP(value, all, friends, closeFriends, aqua, trending) {
  //   setState(() {
  //     _showPostFilterPOPUP = value;
  //     // _allSelected = all;
  //     // _friendsSelected = friends;
  //     // _closeFriendsSelected = closeFriends;
  //     // _acquaintanceSelected = aqua;
  //     // _trendingSelected = trending;

  //     currentScreen = Home(
  //         hiberPopUp: _hyberPOPUP,
  //         all: all,
  //         friends: friends,
  //         closeFriends: closeFriends,
  //         aqua: aqua,
  //         tranding: trending);
  //   });
  // }

  _addSkillsPOPUP(value) {
    setState(() {
      _showAddSkillsPopup = false;
    });
  }

  _addInterestPOPUP(value) {
    setState(() {
      _showAddInterestPOPUP = false;
    });
  }

  _learnSomethingPOPUP(value) {
    setState(() {
      _showLearnSomethingNewPOPUP = false;
    });
  }

  _startProjectPOPUP(value) {
    setState(() {
      _showStartProjectPOPUP = value;
    });
  }

//================================================================== Animation Controllers ==============================================

  _homepanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Divider(
          indent: 130,
          endIndent: 130,
          thickness: 4,
          color: Colors.black,
        ),
        GestureDetector(
          onTap: () {
            _pc.open();
          },
          child: Text(
            "Adding",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          color: Colors.black,
        ),
        Text(
          "Media",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Status",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Story',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  _clgpanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Divider(
          indent: 130,
          endIndent: 130,
          thickness: 4,
          color: Colors.black,
        ),
        GestureDetector(
          onTap: () {
            _pc.open();
          },
          child: Text(
            "Adding",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          color: Colors.black,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _panelHeightClosed = 0.0;
              _showAddSkillsPopup = true;
            });
          },
          child: Text(
            "Add skills",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _panelHeightClosed = 0.0;

              _showAddInterestPOPUP = true;
            });
          },
          child: Text(
            "Add Interests",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _panelHeightClosed = 0.0;

              _showStartProjectPOPUP = true;
            });
          },
          child: Text(
            'Start a project',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _panelHeightClosed = 0.0;
              _showLearnSomethingNewPOPUP = true;
            });
          },
          child: Text(
            'Learn Something new',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  _footer() {
    return _panelHeightClosed == 0.0
        ? SizedBox()
        : GestureDetector(
            onTap: () {
              _pc.hide();
              setState(() {
                pressed = false;
                _panelHeightClosed = 260;
              });
            },
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Divider(
                    color: Colors.black,
                  ),
                  Text(
                    'Cancle',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .95;
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            body: Stack(
              children: [
                PageStorage(
                  child: currentScreen,
                  bucket: bucket,
                ),
              ],
            ),
            floatingActionButton: _hyberActivated
                ? SizedBox()
                : FloatingActionButton(
                    child: Icon(Icons.add, size: 30),
                    elevation: 0.0,
                    backgroundColor: Color(0xFF0CB5BB),
                    onPressed: () async {
                      // openBottomModelSheet();
                      //   _pc.show();
                      if (!_hyberActivated)
                        setState(() {
                          currentScreen = Gallery();
                          pressed = true;
                          // _panelHeightClosed = 260;
                        });
                    },
                  ),
            floatingActionButtonLocation: _hyberActivated
                ? FloatingActionButtonLocation.centerFloat
                : FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: _hyberActivated
                ? BottomAppBar(
                    shape: CircularNotchedRectangle(),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _hyberActivated = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/lock.png"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Hibernation Mode : "),
                                Text(
                                  "ON",
                                  style: TextStyle(color: Color(0xFF27AE60)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : BottomAppBar(
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
                                onLongPress: () {
                                  if (!_hyberActivated) if (currentTab == 0)
                                    setState(() {
                                      _showPostFilterPOPUP = true;
                                    });
                                },
                                onTap: () {
                                  //    if (!_hyberActivated)
                                  setState(() {
                                    currentScreen = Home(
                                        //   hiberPopUp: _hyberPOPUP,
                                        ); // if user taps on this dashboard tab will be active
                                    currentTab = 0;
                                  });
                                },
                                child: _hyberActivated
                                    ? SvgPicture.asset(
                                        "assets/images/hybernation_home.svg",
                                        height: 30,
                                        color: currentTab == 0
                                            ? Color(0xFF0CB5BB)
                                            : Colors.black)
                                    : currentTab == 0
                                        ? Icon(Icons.home,
                                            size: 30, color: Color(0xFF0CB5BB))
                                        : Icon(Icons.home,
                                            size: 30,
                                            color: Colors
                                                .black)), //please add outlined icon in the icon widget
                            GestureDetector(
                                onTap: () {
                                  //if (!_hyberActivated)
                                  setState(() {
                                    currentScreen = College(
                                        //      hiberPopUp: _hyberPOPUP,
                                        ); // if user taps on this dashboard tab will be active
                                    currentTab = 1;
                                  });
                                },
                                child: _hyberActivated
                                    ? SvgPicture.asset(
                                        "assets/images/hybernation_college.svg",
                                        height: 30,
                                        color: currentTab == 0
                                            ? Color(0xFF0CB5BB)
                                            : Colors.black)
                                    : currentTab == 1
                                        ? Icon(Icons.account_balance,
                                            size: 30, color: Color(0xFF0CB5BB))
                                        : Icon(Icons.account_balance,
                                            size: 30,
                                            color: Colors
                                                .black)), //please add outlined icon in the icon widget
                            SizedBox.shrink(),
                            GestureDetector(
                                onTap: () {
                                  // if (!_hyberActivated)
                                  setState(() {
                                    currentScreen =
                                        Explore(); // if user taps on this dashboard tab will be active
                                    currentTab = 2;
                                  });
                                },
                                child: _hyberActivated
                                    ? SvgPicture.asset(
                                        "assets/images/hybernation_language.svg",
                                        height: 30,
                                        color: currentTab == 0
                                            ? Color(0xFF0CB5BB)
                                            : Colors.black)
                                    : currentTab == 2
                                        ? Icon(Icons.language,
                                            size: 30, color: Color(0xFF0CB5BB))
                                        : Icon(Icons.language,
                                            size: 30,
                                            color: Colors
                                                .black)), //please add outlined icon in the icon widget
                            GestureDetector(
                                onTap: () {
                                  // if (!_hyberActivated)
                                  setState(() {
                                    currentScreen =
                                        Profile(); // if user taps on this dashboard tab will be active
                                    currentTab = 3;
                                  });
                                },
                                child: _hyberActivated
                                    ? SvgPicture.asset(
                                        "assets/images/hybernation_user.svg",
                                        height: 30,
                                        color: currentTab == 0
                                            ? Color(0xFF0CB5BB)
                                            : Colors.black)
                                    : currentTab == 3
                                        ? Icon(Icons.account_circle,
                                            size: 30, color: Color(0xFF0CB5BB))
                                        : Icon(Icons.account_circle,
                                            size: 30,
                                            color: Colors
                                                .black)), // please add outlined icon in the icon widget
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
          //   StreamBuilder(
          //     stream: stream,
          //     builder: (context, snapshot) {
          //       print("Stream");
          //       print(snapshot.data["Counter"].toString());
          //       int count = snapshot.data["Counter"];

          //  //     return _notification(count);
          //       //  Center(
          //       //     child: Container(
          //       //     height: 50,
          //       //     width: 50,
          //       //     margin: EdgeInsets.only(
          //       //       top: 100,
          //       //     ),
          //       //     color: Colors.white,
          //       //   ))
          //       ;
          //     },
          //   ),
          // if (pressed) _slidingUpPanel(),
          // if (_showHyberPOPUP) _hyberPOPUP_UI(),
          // if (_showPostFilterPOPUP) _postFilterPOPUP_UI(),
          // if (_showAddSkillsPopup) _addSkillsPOPUP_UI(),
          // if (_showAddInterestPOPUP) _addInterestPOPUP_UI(),
          // if (_showLearnSomethingNewPOPUP) _learnSomethingPOPUP_UI(),
          // if (_showStartProjectPOPUP) _startProjectPOPUP_UI(),
        ],
      ),
    );
  }

  // _notification(type) {
  //   switch (type) {
  //     case 0:
  //       return SizedBox();
  //     case 1:
  //       return CardNotificationAnimation(
  //         message: "Card 1 Notification",
  //         type: 1,
  //       );
  //     case 2:
  //       return CardNotificationAnimation(
  //         message: "Card 2 Notification",
  //         type: 2,
  //       );
  //     case 3:
  //       return CardNotificationAnimation(
  //         message: "Card 3 Notification",
  //         type: 3,
  //       );
  //     case 4:
  //       return CardNotificationAnimation(
  //         message: "Card 4 Notification",
  //         type: 4,
  //       );
  //     case 5:
  //       return CardNotificationAnimation(
  //         message: "Push Notification",
  //         type: 5,
  //       );
  //   }
  // }

  _slidingUpPanel() {
    return SlidingUpPanel(
      // maxHeight: MediaQuery.of(context).size.height - 20,
      maxHeight: _panelHeightOpen,
      minHeight: _panelHeightClosed,
      controller: _pc,
      //   minHeight: 230,
      onPanelSlide: (double pos) => setState(() {
        _fabHeight =
            pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
        _oldHeight = _newHeight;
        _newHeight = _fabHeight;
        if (_fabHeight > (MediaQuery.of(context).size.height * .95) / 2) {
          if (_newHeight < _oldHeight) {
            setState(() {
              _panelHeightClosed = 0.0;
            });
            _pc.close().then((value) {
              // _pc.hide();

              setState(() {
                _panelHeightClosed = 230.0;
                _newHeight = 230;
                _oldHeight = 230;
                pressed = false;
              });
            });
          }
        }
        print(_fabHeight);
      }),

      panel: currentTab == 1 ? _clgpanel() : _homepanel(),

      footer: _footer(),
    );
  }

  // _hyberPOPUP_UI() {
  //   return HyberNationAnimation(
  //     hyberPOPUP: _hyberPOPUP,
  //     setCurrentScreen: _setCurrentScreen,
  //   );
  // }

  // _postFilterPOPUP_UI() {
  //   return PostFilterPopUpAnimation(
  //     postFilterPOPUP: _postFilterPOPUP,
  //   );
  // }

  // _addSkillsPOPUP_UI() {
  //   return SkillsPopUpAnimation(
  //     addSkillsPOPUP: _addSkillsPOPUP,
  //   );
  // }

  // _addInterestPOPUP_UI() {
  //   return AddInterestsPopUpAnimation(
  //     addInterestPOPUP: _addInterestPOPUP,
  //   );
  // }

  // _learnSomethingPOPUP_UI() {
  //   return LearnSomethingNewPopUpAnimation(
  //     learnSomethingNewPOPUP: _learnSomethingPOPUP,
  //   );
  // }

  // _startProjectPOPUP_UI() {
  //   return StartProjectPopUpAnimation(
  //     startProjetPOPUP: _startProjectPOPUP,
  //   );
  // }

  // Color hexToColor(String code) {
  //   return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  // }
}
