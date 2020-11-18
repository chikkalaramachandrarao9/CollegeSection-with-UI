import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yibe_final_ui/serivice/money_database.dart';

class Summary extends StatefulWidget {
  final String uid;
  Summary({this.uid});
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  Stream allActiveLentTransactions;
  Stream allActiveBorrowedTransactions;
  Stream allSettledLentTransactions;
  Stream allSettledBorrowedTransactions;

  @override
  void initState() {
    super.initState();
    Stream<QuerySnapshot> alt =
        MoneyDatabaseService(uid: widget.uid).getActiveLentTransactions();
    Stream<QuerySnapshot> abt =
        MoneyDatabaseService(uid: widget.uid).getActiveBorrowedTransactions();
    Stream<QuerySnapshot> slt =
        MoneyDatabaseService(uid: widget.uid).getSettledLentTransactions();
    Stream<QuerySnapshot> sbt =
        MoneyDatabaseService(uid: widget.uid).getSettledBorrowedTransactions();
    setState(() {
      allActiveLentTransactions = alt;
      allActiveBorrowedTransactions = abt;
      allSettledLentTransactions = slt;
      allSettledBorrowedTransactions = sbt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage('images/share_money.png')),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: Text(
                    'Reminder',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff12ACB1),
                        fontSize: 20.0),
                  ),
                ),
              ),
              //  Container(child: Text('Reminder', style:
              // TextStyle(color: Color(0xff12ACB1), fontSize: 25.0),),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Given To',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              //                 Text('Given to' , style: TextStyle(fontWeight: FontWeight.bold),),
              listofallActiveLentTransactions(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Taken From',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              listofallActiveBorrowedTransactions(),
              SizedBox(height: 10),
              Center(
                child: Container(
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
              listofallSettledBorrowedTransactions(),
            ],
          ),
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
            return Container();
          }

          if (snapshot.data == null || snapshot.data.documents.length == 0) {
            return Container();
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
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
            return Container();
          }

          if (snapshot.data == null || snapshot.data.documents.length == 0) {
            print('no history lent transactions');
            return Container();
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
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
}
