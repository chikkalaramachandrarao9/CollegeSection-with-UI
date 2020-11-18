import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:yibe_final_ui/serivice/money_database.dart';

class Borrow extends StatefulWidget {
  final String uid;

  Borrow({this.uid});
  @override
  _BorrowState createState() => _BorrowState();
}

class _BorrowState extends State<Borrow> {
  Stream allActiveBorrowedTransactions;
  Stream allSettledBorrowedTransactions;

  @override
  void initState() {
    super.initState();
    Stream<QuerySnapshot> abt =
        MoneyDatabaseService(uid: widget.uid).getActiveBorrowedTransactions();
    Stream<QuerySnapshot> sbt =
        MoneyDatabaseService(uid: widget.uid).getSettledBorrowedTransactions();
    setState(() {
      allActiveBorrowedTransactions = abt;
      allSettledBorrowedTransactions = sbt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: QrImage(
                    //plce where the QR Image will be shown
                    //  data: widget.uid,
                    data: 'aVfgckVxKJbgutmLFJdWEn22ALr2',
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 15),
                  child: Text(
                    'Active',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff12ACB1),
                        fontSize: 20.0),
                  ),
                ),
              ),
              listofallActiveBorrowedTransactions(),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 15),
                  child: Text(
                    'History',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff12ACB1),
                        fontSize: 20.0),
                  ),
                ),
              ),
              listofallSettledBorrowedTransactions(),
            ]),
            /* QrImage(
              //plce where the QR Image will be shown
              data: qrData,
            ),
            SizedBox(
              height: 20.0,
            ),*/
            // Text(
            //   "New QR Link Generator",
            //   style: TextStyle(fontSize: 20.0),
            // ),
            // TextField(
            //   controller: qrdataFeed,
            //   decoration: InputDecoration(
            //     hintText: "Input your link or data",
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            //   child: FlatButton(
            //     padding: EdgeInsets.all(15.0),
            //     onPressed: () async {
            //
            //       if (qrdataFeed.text.isEmpty) {        //a little validation for the textfield
            //         setState(() {
            //           qrData = "";
            //         });
            //       } else {
            //         setState(() {
            //           qrData = qrdataFeed.text;
            //         });
            //       }
            //
            //     },
            //     child: Text(
            //       "Generate QR",
            //       style: TextStyle(
            //           color: Colors.blue, fontWeight: FontWeight.bold),
            //     ),
            //     shape: RoundedRectangleBorder(
            //         side: BorderSide(color: Colors.blue, width: 3.0),
            //         borderRadius: BorderRadius.circular(20.0)),
            //   ),
            // )
          ],
        ),
      ),
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

  Widget listofallActiveBorrowedTransactions() {
    return StreamBuilder(
        stream: allActiveBorrowedTransactions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('in waiting');
            return noActiveTransactionsFound('borrow');
          }

          if (snapshot.data == null || snapshot.data.documents.length == 0) {
            print('no active borrowed transactions');
            return noActiveTransactionsFound('borrow');
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
                                    .settleABorrowedTransaction(
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

  Widget listofallSettledBorrowedTransactions() {
    return StreamBuilder(
        stream: allSettledBorrowedTransactions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('in waiting');
            return noHistoryTransactionsFound('borrow');
          }

          if (snapshot.data == null || snapshot.data.documents.length == 0) {
            print('no history borrowed transactions');
            return noHistoryTransactionsFound('borrow');
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
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
// final qrdataFeed = TextEditingController();
}
