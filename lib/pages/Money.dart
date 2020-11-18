import 'dart:ui';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../animations/PaymentPopUpAnimation.dart';

class Money extends StatefulWidget {
  static final routeName = "/Money";
  @override
  _MoneyState createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
  String qrData = "Its me simba";
  String qrCodeResult = "Not Yet Scanned";
  List<String> mainList = ['Lend', 'Summary', 'Borrow'];
  var activeIndex = 2;

  switchIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  String amount;
  bool _showPaymentPOPUP = false;
  bool _displayListAmount = false;
  bool _showTransectionStatePOPUP = false;
  _dispayPaymentPopUp(value, isConform) {
    setState(() {
      // if (isConform)
      //_showTransectionStatePOPUP = true;
      // else {
      _showPaymentPOPUP = value;
      _camState = true;
      // }
    });
  }

  _displayStatePOPUP(value) {
    setState(() {
      _showTransectionStatePOPUP = value;
      _showPaymentPOPUP = value;
      _camState = true;
    });
  }

  _displayPaymentList(value) {
    setState(() {
      amount = value;
      _displayListAmount = true;
    });
  }
  //===========================  fro Scanner  =====================================

  String _qrInfo = 'Scan a QR/Bar code';
  bool _camState = false;

  _qrCallback(String code) {
    setState(() {
      _camState = false;
      _qrInfo = code;
      _showPaymentPOPUP = true;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    super.dispose();
  }

//==================================================================================
  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        'Money',
                        style:
                            TextStyle(color: Color(0xff12ACB1), fontSize: 30.0),
                      ),
                    ),
                  ),
                  Container(
                      //  color: Colors.black,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: ListView.builder(
                            itemCount: mainList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var item = mainList[index];

                              return GestureDetector(
                                onTap: () {
                                  switchIndex(index);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Container(
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: activeIndex == index
                                            ? Colors.black
                                            : Colors.black26,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )),
                  bottomBar(),
                ]),
          ),
          if (_showPaymentPOPUP)
            PaymentPopUpAnimation(
              dispayPaymentPopUp: _dispayPaymentPopUp,
              displayPaymentList: _displayPaymentList,
            ),
          // if (_showTransectionStatePOPUP)
          //   TransactionStatePopUpAnimation(
          //     diaplayStatePOPUP: _displayStatePOPUP,
          //     message: "Recorded Successfully",
          //   )
        ],
      ),
    );
  }

  Widget bottomBar() {
    switch (activeIndex) {
      case 0:
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    //   color: Colors.red,
                    // image: DecorationImage(
                    //     image: AssetImage('assets/images/qr_code.png')),

                    ),
                child: QrImage(
                  //plce where the QR Image will be shown
                  data: qrData,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Active',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff12ACB1),
                      fontSize: 20.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Suraj'),
                  Text(
                    '150',
                    style: TextStyle(color: Color(0xff12ACB1), fontSize: 20.0),
                  ),
                  Text('16-04-20'),
                  ButtonTheme(
                    height: 25.0,
                    child: OutlineButton(
                        shape: StadiumBorder(),
                        borderSide: BorderSide(color: Color(0xff12ACB1)),
                        onPressed: () {},
                        child: Text(
                          'Settle',
                          style: TextStyle(
                              color: Color(0xff12ACB1), fontSize: 20.0),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Sasha'),
                  Text(
                    '\$150',
                    style: TextStyle(color: Color(0xff12ACB1), fontSize: 20.0),
                  ),
                  Text('16-04-20'),
                  ButtonTheme(
                    height: 25.0,
                    child: OutlineButton(
                        shape: StadiumBorder(),
                        borderSide: BorderSide(color: Color(0xff12ACB1)),
                        onPressed: () {},
                        child: Text(
                          'Settle',
                          style: TextStyle(
                              color: Color(0xff12ACB1), fontSize: 20.0),
                        )),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'History',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff12ACB1),
                      fontSize: 20.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Suraj'),
                  Text(
                    '\$150',
                    style: TextStyle(color: Color(0xff12ACB1), fontSize: 20.0),
                  ),
                  Text('16-04-20'),
                  Text('16-04-20')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Sasha'),
                  Text(
                    '\$150',
                    style: TextStyle(color: Color(0xff12ACB1), fontSize: 20.0),
                  ),
                  Text('16-04-20'),
                  Text('16-04-20')
                ],
              ),
            ],
          ),
        );
        break;
      case 1:
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  //   color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage('assets/images/share_money.png')),
                ),
              ),

              Container(
                child: Text(
                  'Reminder',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff12ACB1),
                      fontSize: 20.0),
                ),
              ),
              //  Container(child: Text('Reminder', style:
              // TextStyle(color: Color(0xff12ACB1), fontSize: 25.0),),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Given To',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              //                 Text('Given to' , style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Suraj'),
                  Text(
                    '\$150',
                    style: TextStyle(color: Color(0xff12ACB1), fontSize: 20.0),
                  ),
                  Text('16-04-20'),
                  ButtonTheme(
                    height: 25.0,
                    child: OutlineButton(
                        shape: StadiumBorder(),
                        borderSide: BorderSide(color: Color(0xff12ACB1)),
                        onPressed: () {},
                        child: Text(
                          'Settle',
                          style: TextStyle(
                              color: Color(0xff12ACB1), fontSize: 20.0),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Taken From',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Sasha'),
                  Text(
                    '\$150',
                    style: TextStyle(color: Color(0xff12ACB1), fontSize: 20.0),
                  ),
                  Text('16-04-20'),
                  ButtonTheme(
                    height: 25.0,
                    child: OutlineButton(
                        shape: StadiumBorder(),
                        borderSide: BorderSide(color: Color(0xff12ACB1)),
                        onPressed: () {},
                        child: Text(
                          'Settle',
                          style: TextStyle(
                              color: Color(0xff12ACB1), fontSize: 20.0),
                        )),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                child: Text(
                  'History',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff12ACB1),
                      fontSize: 20.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Suraj'),
                  Text(
                    '\$150',
                    style: TextStyle(color: Color(0xff12ACB1), fontSize: 20.0),
                  ),
                  Text('16-04-20'),
                  Text('16-04-20')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Sasha'),
                  Text(
                    '\$150',
                    style: TextStyle(color: Color(0xff12ACB1), fontSize: 20.0),
                  ),
                  Text('24-04-20'),
                  Text('24-04-20')
                ],
              ),
            ],
          ),
        );

        break;

      case 2:
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(15),
              //     child: Container(
              //       margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              //       height: 230,
              //       width: MediaQuery.of(context).size.width,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           color: Colors.grey),
              //       child: _camState
              //           ? QRBarScannerCamera(
              //               onError: (context, error) => Text(
              //                 error.toString(),
              //                 style: TextStyle(color: Colors.red),
              //               ),
              //               qrCodeCallback: (code) {
              //                 _qrCallback(code);
              //               },
              //             )
              //           : Container(),
              //     ),
              //   ),
              // ),
              _camState
                  ? SizedBox()
                  : Center(
                      child: Text(_qrInfo),
                    ),

              GestureDetector(
                onTap: () async {
                  String codeSanner = await BarcodeScanner.scan();
                  setState(() {
                    qrCodeResult = codeSanner;
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    //   color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage('assets/images/scanner_money.png')),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          qrCodeResult,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text('Total amout borrowed'),
                        Text('₹1583'),
                      ]),
                ),
              ),
              Container(
                child: Text(
                  'Active',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff12ACB1),
                      fontSize: 20.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Suraj'),
                  Text(
                    '\$150',
                    style: TextStyle(color: Color(0xff12ACB1), fontSize: 20.0),
                  ),
                  Text('16-04-20'),
                  ButtonTheme(
                    height: 25.0,
                    child: OutlineButton(
                        shape: StadiumBorder(),
                        borderSide: BorderSide(color: Color(0xff12ACB1)),
                        onPressed: () {},
                        child: Text(
                          'Settle',
                          style: TextStyle(
                              color: Color(0xff12ACB1), fontSize: 20.0),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Sasha'),
                  Text(
                    '\$150',
                    style: TextStyle(color: Color(0xff12ACB1), fontSize: 20.0),
                  ),
                  Text('16-04-20'),
                  ButtonTheme(
                    height: 25.0,
                    child: OutlineButton(
                        shape: StadiumBorder(),
                        borderSide: BorderSide(color: Color(0xff12ACB1)),
                        onPressed: () {},
                        child: Text(
                          'Settle',
                          style: TextStyle(
                              color: Color(0xff12ACB1), fontSize: 20.0),
                        )),
                  ),
                ],
              ),
              if (amount != null || amount != 0)
                _displayListAmount
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Vaibhavi'),
                          Text(
                            '\$' + amount,
                            style: TextStyle(
                                color: Color(0xff12ACB1), fontSize: 20.0),
                          ),
                          Text('10-15-20'),
                          ButtonTheme(
                            height: 25.0,
                            child: OutlineButton(
                                shape: StadiumBorder(),
                                borderSide:
                                    BorderSide(color: Color(0xff12ACB1)),
                                onPressed: () {},
                                child: Text(
                                  'Settle',
                                  style: TextStyle(
                                      color: Color(0xff12ACB1), fontSize: 20.0),
                                )),
                          ),
                        ],
                      )
                    : Container(),
              Divider(
                color: Colors.black,
              ),
              Container(
                child: Text(
                  'History',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff12ACB1),
                      fontSize: 20.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Suraj'),
                  Text(
                    '\$150',
                    style: TextStyle(color: Color(0xff12ACB1), fontSize: 20.0),
                  ),
                  Text('16-04-20'),
                  Text('16-04-20')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Sasha'),
                  Text(
                    '\$150',
                    style: TextStyle(color: Color(0xff12ACB1), fontSize: 20.0),
                  ),
                  Text('16-04-20'),
                  Text('16-04-20')
                ],
              ),
            ],
          ),
        );
        break;
      default:
        break;
    }
  }
}

/////****
///
///
///
/// */
