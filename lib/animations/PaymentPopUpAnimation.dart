import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentPopUpAnimation extends StatefulWidget {
  Function dispayPaymentPopUp;
  Function displayPaymentList;
  PaymentPopUpAnimation({
    Key key,
    this.dispayPaymentPopUp,
    this.displayPaymentList,
  }) : super(key: key);
  @override
  _PaymentPopUpAnimationState createState() => _PaymentPopUpAnimationState();
}

class _PaymentPopUpAnimationState extends State<PaymentPopUpAnimation>
    with TickerProviderStateMixin {
  AnimationController _paymentCotroller;
  Animation<Offset> _paymentOffset;
  TextEditingController _amount = TextEditingController();
  bool _isConformed = false;

  @override
  void initState() {
    // TODO: implement initState
    _paymentCotroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _paymentOffset = Tween<Offset>(end: Offset.zero, begin: Offset(0.0, 1.0))
        .animate(_paymentCotroller);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    switch (_paymentCotroller.status) {
      case AnimationStatus.completed:
        _paymentCotroller.reverse();
        break;
      case AnimationStatus.dismissed:
        _paymentCotroller.forward();
        break;
      default:
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (_paymentCotroller.status) {
          case AnimationStatus.completed:
            _paymentCotroller.reverse().then((value) {
              widget.dispayPaymentPopUp(false, false);
              // widget.displayPaymentList(_amount.text.trim());
            });
            break;
          case AnimationStatus.dismissed:
            _paymentCotroller.forward().then((value) {
              setState(() {
                // widget.postFilterPOPUP(false);
                //  _showPostFilterPOPUP = false;
              });
            });
            break;
          default:
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFF0F0F0F).withOpacity(0.5),
        body: BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SlideTransition(
                  position: _paymentOffset,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 400.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(25.0),
                          child: _isConformed
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 140,
                                    ),
                                    SvgPicture.asset(
                                        "assets/images/successfull.svg"),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Recorded Successfully ',
                                      style: TextStyle(
                                        color: Color(0xFF27AE60),
                                        fontSize: 18.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              : Column(children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    leading: Container(
                                      width: 80.0,
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/vaibhavi_square.png'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    title: Text(
                                      'Vaibhavi FanGirl',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '@vaibhavi',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFA7A7A7),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 91.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                          width: 1.0, color: Color(0xFF0CB5BB)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            'Enter Amount',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFA7A7A7),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "₹",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 36,
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .7,
                                              child: TextField(
                                                controller: _amount,
                                                keyboardType:
                                                    TextInputType.number,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 36,
                                                ),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                  hintText: '0.0000',
                                                  hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 36,
                                                  ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text(
                                        'Due Date',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFA7A7A7),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 50.0,
                                        width: 60.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                              width: 1.0,
                                              color: Color(0xFF0CB5BB)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 3.0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              hintText: 'DD',
                                              hintStyle: TextStyle(
                                                color: Color(0xFFA7A7A7),
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.0),
                                      Container(
                                        height: 50.0,
                                        width: 60.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                              width: 1.0,
                                              color: Color(0xFF0CB5BB)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 3.0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              hintText: 'MM',
                                              hintStyle: TextStyle(
                                                color: Color(0xFFA7A7A7),
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.0),
                                      Container(
                                        height: 50.0,
                                        width: 77.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                              width: 1.0,
                                              color: Color(0xFF0CB5BB)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 3.0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              hintText: 'YYYY',
                                              hintStyle: TextStyle(
                                                color: Color(0xFFA7A7A7),
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                          width: 1.0, color: Color(0xFF0CB5BB)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 3.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Comment',
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        widget.displayPaymentList(
                                            _amount.text.trim());
                                        setState(() {
                                          _isConformed = true;
                                        });

                                        Future.delayed(
                                            Duration(milliseconds: 500), () {
                                          _paymentCotroller
                                              .reverse()
                                              .then((value) {
                                            widget.dispayPaymentPopUp(
                                                false, true);
                                          });
                                        });
                                      },
                                      child: Container(
                                        height: 40.0,
                                        width: 195.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF0CB5BB),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Confirm Transection',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
