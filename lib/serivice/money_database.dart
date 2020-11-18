import 'package:cloud_firestore/cloud_firestore.dart';

class MoneyDatabaseService {
  final String uid;
  MoneyDatabaseService({this.uid});

  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<Map> getBorrowerDetails(String borrowerId) async {
    DocumentSnapshot doc = await usersCollection.doc(borrowerId).get();
    return doc.data();
  }

  Future<Map> getLenderDetails() async {
    DocumentSnapshot doc = await usersCollection.doc(uid).get();
    return doc.data();
  }

  /*Future<bool> checkIfBorrowerAlreadyExists(String borrowerId) async {
    bool borrowerAlreadyExist = false;
    try {
      await usersCollection.doc(uid).collection('Lent').doc(borrowerId).get().then((doc) {
        doc.exists ? borrowerAlreadyExist = true : borrowerAlreadyExist = false;
      });
      return borrowerAlreadyExist;
    } catch(e){
      print(e);
      return false;
    }
  }

  Future updateAmountValueIfBorrowerAlreadyExist(double amount, String borrowerId) async {
    DocumentSnapshot doc = await usersCollection.doc(uid).collection('Lent').doc(borrowerId).get();
    final double totalAmount = doc.data()['amount'] + amount;
    await usersCollection.doc(borrowerId).collection('Borrowed').doc(uid).update({'amount':totalAmount});
    await usersCollection.doc(uid).collection('Lent').doc(borrowerId).update({'amount': totalAmount});
  }*/

  Future addTransactionDetails(Map borrowerDetails, Map lenderDetails, String borrowerId, String transactionId) async {
    await usersCollection.doc(borrowerId).collection('Borrowed').doc(transactionId).set(lenderDetails);
    await usersCollection.doc(uid).collection('Lent').doc(transactionId).set(borrowerDetails);
  }

  Stream<QuerySnapshot> getActiveLentTransactions() {
    return usersCollection.doc(uid).collection('Lent').where('isActive', isEqualTo: true).orderBy('timeOfTransaction', descending: true).snapshots();
  }

  Stream<QuerySnapshot> getSettledLentTransactions() {
    return usersCollection.doc(uid).collection('Lent').where('isActive', isEqualTo: false).orderBy('timeOfTransaction', descending: true).snapshots();
  }

  Stream<QuerySnapshot> getActiveBorrowedTransactions() {
    return usersCollection.doc(uid).collection('Borrowed').where('isActive', isEqualTo: true).orderBy('timeOfTransaction', descending: true).snapshots();
  }

  Stream<QuerySnapshot> getSettledBorrowedTransactions() {
    return usersCollection.doc(uid).collection('Borrowed').where('isActive', isEqualTo: false).orderBy('timeOfTransaction', descending: true).snapshots();
  }

  Future settleALentTransaction(String transactionId, String settledDate) async {
    print('in settle lent t');
    print(transactionId);
    await usersCollection.doc(uid).collection('Lent').doc(transactionId).update({'isActive' : false, 'settledOn': settledDate});
  }

  Future settleABorrowedTransaction(String transactionId, String settledDate) async {
    print('in settle borrowed t');
    print(transactionId);
    await usersCollection.doc(uid).collection('Borrowed').doc(transactionId).update({'isActive' : false, 'settledOn': settledDate});
  }

}
