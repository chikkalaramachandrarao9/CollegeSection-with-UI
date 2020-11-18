import 'package:barcode_scan/barcode_scan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yibe_final_ui/pages/Money/PaymentPopUpAnimation.dart';
import 'package:yibe_final_ui/serivice/money_database.dart';

class Lend extends StatefulWidget {
  final String uid;
  Lend({this.uid});
  @override
  _LendState createState() => _LendState();
}

class _LendState extends State<Lend> {
  String qrCodeResult = "Not Yet Scanned";
  bool _showPaymentPOPUP = false;
  bool _camState = false;
  bool _displayListAmount = false;
  Map borrowerDetails;
  Map lenderDetails;
  Stream allActiveLentTransactions;
  Stream allSettledLentTransactions;

  @override
  void initState() {
    super.initState();
    MoneyDatabaseService(uid: widget.uid)
        .getLenderDetails()
        .then((value) => setState(() {
              lenderDetails = value;
            }));
    //print(lenderDetails);
    Stream<QuerySnapshot> alt =
        MoneyDatabaseService(uid: widget.uid).getActiveLentTransactions();
    Stream<QuerySnapshot> slt =
        MoneyDatabaseService(uid: widget.uid).getSettledLentTransactions();
    setState(() {
      allActiveLentTransactions = alt;
      allSettledLentTransactions = slt;
    });
  }

  Future<String> getBorrowerQRCode() async {
    String codeSanner = await BarcodeScanner.scan(); //barcode scnner
    setState(() {
      qrCodeResult = codeSanner;
    });
    return qrCodeResult;
  }

  _qrCallback(String code) {
    MoneyDatabaseService(uid: widget.uid)
        .getBorrowerDetails(code)
        .then((value) => setState(() {
              borrowerDetails = value;
            }));
    setState(() {
      _camState = false;
      _showPaymentPOPUP = true;
    });
  }

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

  _displayPaymentList(value) {
    setState(() {
      _displayListAmount = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () =>
                      getBorrowerQRCode().then((value) => _qrCallback(value)),
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
                            'Tap above to scan QR code',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // Text('Total amount lent'),
                          //Text('₹1583'),
                        ]),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Text(
                      'Active',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff12ACB1),
                          fontSize: 20.0),
                    ),
                  ),
                ),
                listofallActiveLentTransactions(),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Text(
                      'History',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff12ACB1),
                          fontSize: 20.0),
                    ),
                  ),
                ),
                listofallSettledLentTransactions(),
              ],
            ),
          ),
        ),
        if (_showPaymentPOPUP)
          PaymentPopUpAnimation(
            borrowerId: qrCodeResult,
            lenderData: lenderDetails,
            borrowerData: borrowerDetails,
            uid: widget.uid,
            dispayPaymentPopUp: _dispayPaymentPopUp,
            displayPaymentList: _displayPaymentList,
          ),
      ]),
    );
  }

  Widget noActiveTransactionsFound(String page) {
    return Center(
      child: Column(children: [
        SizedBox(height: 10.0),
        Text(page == 'lent'
            ? "No active lent transactions"
            : "No active borrowed transactions"),
      ]),
    );
  }

  Widget noHistoryTransactionsFound(String page) {
    return Center(
      child: Column(children: [
        SizedBox(height: 10.0),
        Text(page == 'lent'
            ? "No history of lent transactions"
            : "No history of borrowed transactions"),
      ]),
    );
  }

  Widget listofallActiveLentTransactions() {
    return StreamBuilder(
        stream: allActiveLentTransactions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('in waiting');
            return noActiveTransactionsFound('lent');
          }

          if (snapshot.data == null || snapshot.data.documents.length == 0) {
            print('no active lent transactions');
            return noActiveTransactionsFound('lent');
          }
          var transactions = snapshot.data.documents;
          return Column(children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: transactions.length,
                itemBuilder: (context, i) {
                  print(transactions[i].data()['id']);
                  print(transactions[i].data()['isActive']);
                  return Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(transactions[i].data()['name']),
                        Text(
                          '\$' + '${transactions[i].data()['amount']}',
                          style: TextStyle(
                              color: Color(0xff12ACB1), fontSize: 20.0),
                        ),
                        Text(transactions[i].data()['dueDate']),
                        ButtonTheme(
                          height: 25.0,
                          child: OutlineButton(
                              shape: StadiumBorder(),
                              borderSide: BorderSide(color: Color(0xff12ACB1)),
                              onPressed: () {
                                String year =
                                    Timestamp.now().toDate().year.toString();
                                String month =
                                    Timestamp.now().toDate().month.toString();
                                String date =
                                    Timestamp.now().toDate().day.toString();
                                String settleDate =
                                    date + '/' + month + '/' + year;
                                MoneyDatabaseService(uid: widget.uid)
                                    .settleALentTransaction(
                                        transactions[i].data()['id'],
                                        settleDate);
                              },
                              child: Text(
                                'Settle',
                                style: TextStyle(
                                    color: Color(0xff12ACB1), fontSize: 20.0),
                              )),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10.0,
                      color: Colors.black,
                    ),
                  ]);
                }),
          ]);
        });
  }

  Widget listofallSettledLentTransactions() {
    return StreamBuilder(
        stream: allSettledLentTransactions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('in waiting');
            return noHistoryTransactionsFound('lent');
          }

          if (snapshot.data == null || snapshot.data.documents.length == 0) {
            print('no history lent transactions');
            return noHistoryTransactionsFound('lent');
          }

          var transactions = snapshot.data.documents;
          return Column(children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: transactions.length,
                itemBuilder: (context, i) {
                  print(transactions[i].data()['id']);
                  print(transactions[i].data()['isActive']);
                  return Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(transactions[i].data()['name']),
                        Text(
                          '\$' + '${transactions[i].data()['amount']}',
                          style: TextStyle(
                              color: Color(0xff12ACB1), fontSize: 20.0),
                        ),
                        Text(transactions[i].data()['dueDate']),
                        Text(transactions[i].data()['settledOn']),
                      ],
                    ),
                    Divider(
                      height: 10.0,
                      color: Colors.black,
                    ),
                  ]);
                })
          ]);
        });
  }
}
