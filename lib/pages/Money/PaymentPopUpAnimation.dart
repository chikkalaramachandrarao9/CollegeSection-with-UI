import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uuid/uuid.dart';
import 'package:yibe_final_ui/model/money.dart';
import 'package:yibe_final_ui/serivice/money_database.dart';

class PaymentPopUpAnimation extends StatefulWidget {
  Map borrowerData;
  Map lenderData;
  String borrowerId;
  String uid;
  Function dispayPaymentPopUp;
  Function displayPaymentList;
  PaymentPopUpAnimation(
      {Key key,
      this.dispayPaymentPopUp,
      this.displayPaymentList,
      this.borrowerData,
      this.lenderData,
      this.borrowerId,
      this.uid})
      : super(key: key);
  @override
  _PaymentPopUpAnimationState createState() => _PaymentPopUpAnimationState();
}

class _PaymentPopUpAnimationState extends State<PaymentPopUpAnimation>
    with TickerProviderStateMixin {
  AnimationController _paymentController;
  Animation<Offset> _paymentOffset;
  TextEditingController _amount = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _month = TextEditingController();
  TextEditingController _year = TextEditingController();
  TextEditingController _comment = TextEditingController();
  bool formError = false;
  bool _isConfirmed = false;
  var uuid = Uuid();

  @override
  void initState() {
    // TODO: implement initState
    _paymentController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _paymentOffset = Tween<Offset>(end: Offset.zero, begin: Offset(0.0, 1.0))
        .animate(_paymentController);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    switch (_paymentController.status) {
      case AnimationStatus.completed:
        _paymentController.reverse();
        break;
      case AnimationStatus.dismissed:
        _paymentController.forward();
        break;
      default:
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (_paymentController.status) {
          case AnimationStatus.completed:
            print(_isConfirmed);
            print('inside animation completed');
            _paymentController.reverse().then((value) {
              widget.dispayPaymentPopUp(false, false);
              // widget.displayPaymentList(_amount.text.trim());
            });
            break;
          case AnimationStatus.dismissed:
            print(_isConfirmed);
            print('inside animation dismissed');
            _paymentController.forward().then((value) {
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
                        height: 450.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(25.0),
                          child: _isConfirmed
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 140,
                                    ),
                                    SvgPicture.asset("images/successfull.svg"),
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
                                                'images/vaibhavi_square.png'), //TODO: Replace with actual profile url of borrower
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    title: Text(
                                      widget.borrowerData['username'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Text(
                                      widget.borrowerData['email'],
                                      //'@vaibhavi',
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
                                                    color: Colors.grey,
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
                                            controller: _date,
                                            maxLength: 2,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              hintText: 'DD',
                                              hintStyle: TextStyle(
                                                color: Color(0xFFA7A7A7),
                                                fontSize: 15,
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
                                            controller: _month,
                                            maxLength: 2,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              hintText: 'MM',
                                              hintStyle: TextStyle(
                                                color: Color(0xFFA7A7A7),
                                                fontSize: 15,
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
                                            controller: _year,
                                            maxLength: 4,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              hintText: 'YYYY',
                                              hintStyle: TextStyle(
                                                color: Color(0xFFA7A7A7),
                                                fontSize: 15,
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
                                        controller: _comment,
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
                                        if (_amount.text != '' &&
                                            _date.text != '' &&
                                            _month.text != '' &&
                                            _year.text != '' &&
                                            _comment.text != '') {
                                          widget.displayPaymentList(
                                              _amount.text.trim());
                                          setState(() {
                                            _isConfirmed = true;
                                          });
                                          final String docId = uuid.v4();
                                          print(docId);
                                          /* MoneyDatabaseService(uid: widget.uid).checkIfBorrowerAlreadyExists(widget.borrowerId).then((value) {
                                          print('in checking state of borrower');
                                          print('borrower exists' + value.toString());
                                          if(value==true){
                                            MoneyDatabaseService(uid: widget.uid).updateAmountValueIfBorrowerAlreadyExist(double.parse(_amount.text.trim()), widget.borrowerId);
                                          }
                                          else{*/
                                          TransactionDetails b =
                                              TransactionDetails(
                                                  id: docId,
                                                  name: widget.borrowerData[
                                                      'username'],
                                                  email: widget.borrowerData[
                                                      'email'],
                                                  amount:
                                                      int
                                                          .parse(
                                                              _amount
                                                                  .text
                                                                  .trim()),
                                                  comment: _comment.text,
                                                  dueDate:
                                                      _date
                                                              .text +
                                                          '/' +
                                                          _month.text +
                                                          '/' +
                                                          _year.text,
                                                  userId: widget.borrowerId,
                                                  transactionType: 'lent',
                                                  isActive: true,
                                                  timeOfTransaction:
                                                      Timestamp.now());
                                          TransactionDetails l =
                                              TransactionDetails(
                                                  id: docId,
                                                  userId: widget.uid,
                                                  name: widget.lenderData[
                                                      'username'],
                                                  email: widget.lenderData[
                                                      'email'],
                                                  amount: int.parse(_amount
                                                      .text
                                                      .trim()),
                                                  comment: _comment.text,
                                                  transactionType: 'borrowed',
                                                  isActive: true,
                                                  dueDate:
                                                      _date
                                                              .text +
                                                          '/' +
                                                          _month.text +
                                                          '/' +
                                                          _year.text,
                                                  timeOfTransaction:
                                                      Timestamp.now());
                                          MoneyDatabaseService(uid: widget.uid)
                                              .addTransactionDetails(
                                                  b.toMap(b),
                                                  l.toMap(l),
                                                  widget.borrowerId,
                                                  docId)
                                              .then((value) =>
                                                  _paymentController
                                                      .reverse()
                                                      .then((value) {
                                                    widget.dispayPaymentPopUp(
                                                        false, true);
                                                  }));
                                        } else {
                                          setState(() {
                                            formError = true;
                                          });
                                        }
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
                                            'Confirm Transaction',
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
                                  formError
                                      ? Center(
                                          child: Text(
                                            'Please fill all fields',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        )
                                      : Container(),
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
