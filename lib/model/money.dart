import 'package:cloud_firestore/cloud_firestore.dart';


class TransactionDetails {
  final String id, userId, name, email, dueDate, comment, transactionType;
  final int amount;
  final Timestamp timeOfTransaction;
  final bool isActive;

  TransactionDetails(
      {this.id, this.userId, this.name, this.email, this.amount, this.dueDate, this.comment, this.transactionType, this.timeOfTransaction, this.isActive});

  Map toMap(TransactionDetails map) {
    var data = <String, dynamic>{};
    data['id'] = map.id;
    data['userId'] = map.userId;
    data['name'] = map.name;
    data['email'] = map.email;
    data['amount'] = map.amount;
    data['dueDate'] = map.dueDate;
    data['comment'] = map.comment;
    data['comment'] = map.comment;
    data['transactionType'] = map.transactionType;
    data['isActive'] = map.isActive;
    data['timeOfTransaction'] = map.timeOfTransaction;
    return data;
  }

}

