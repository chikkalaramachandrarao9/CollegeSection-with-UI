import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yibe_final_ui/models/Activity.dart';

class ActivityDatabaseService {
  final String uid;

  ActivityDatabaseService({this.uid});

  final CollectionReference activityCollection =
      FirebaseFirestore.instance.collection('Activities');

  final CollectionReference sportsCollection =
      FirebaseFirestore.instance.collection('Sports');
  final CollectionReference eSportsCollection =
      FirebaseFirestore.instance.collection('ESports');
  final CollectionReference skillsCollection =
      FirebaseFirestore.instance.collection('Skills');

  List<Activity> _activitiesFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Activity(
        organiserID: doc.get('OrganiserId'),
        activityType: doc.get('ActivityType'),
        activityId: doc.get('ActivityID'),
      );
    }).toList();
  }

  Stream<List<Activity>> getActivities(int type) {
    List<String> activityTypes = ['all', 'Sport', 'ESport', 'Skill'];
    if (type == 0) {
      return activityCollection
          .orderBy('TimeOfRegistration', descending: true)
          .snapshots()
          .map(_activitiesFromSnapshots);
    } else {
      return activityCollection
          .where('ActivityType', isEqualTo: activityTypes[type])
          .orderBy('TimeOfRegistration', descending: true)
          .snapshots()
          .map(_activitiesFromSnapshots);
    }
  }

//  ActivityDetails _detailsFromSnapshot(DocumentSnapshot snapshot) {
//    return ActivityDetails(
//        activityType: snapshot.get('ActivityType'),
//        activityTitle: snapshot.get('Name'),
//        long: snapshot.get('Longitude') ?? '',
//        lat: snapshot.get('Latitude') ?? '',
//        noOfPlayers: snapshot.get('PlayersReq') ?? '',
//        description: snapshot.get('Description'),
//        organiserID: snapshot.get('OrganiserId'),
//        aid: snapshot.id);
//  }

  ActivityDetails _sportDetailsFromSnapshot(DocumentSnapshot snapshot) {
    return ActivityDetails(
        activityType: snapshot.get('ActivityType'),
        activityTitle: snapshot.get('Name'),
        long: snapshot.get('Longitude') ?? '',
        lat: snapshot.get('Latitude') ?? '',
        noOfPlayers: snapshot.get('PlayersReq') ?? '',
        description: snapshot.get('Description'),
        organiserID: snapshot.get('OrganiserId'),
        aid: snapshot.id);
  }

  ActivityDetails _eSportDetailsFromSnapshot(DocumentSnapshot snapshot) {
    return ActivityDetails(
        activityType: snapshot.get('ActivityType'),
        activityTitle: snapshot.get('Name'),
        long: 0,
        lat: 0,
        noOfPlayers: snapshot.get('PlayersReq') ?? '',
        description: snapshot.get('Description'),
        organiserID: snapshot.get('OrganiserId'),
        aid: snapshot.id);
  }

  ActivityDetails _skillDetailsFromSnapshot(DocumentSnapshot snapshot) {
    return ActivityDetails(
        activityType: snapshot.get('ActivityType'),
        activityTitle: snapshot.get('Name'),
        long: 0,
        lat: 0,
        noOfPlayers: 0,
        description: snapshot.get('Description'),
        organiserID: snapshot.get('OrganiserId'),
        aid: snapshot.id);
  }

  Stream<ActivityDetails> getActivityDetails(String id, String type) {
    if (type == 'Sport') {
      return sportsCollection
          .doc(id)
          .snapshots()
          .map(_sportDetailsFromSnapshot);
    } else if (type == 'ESport') {
      return eSportsCollection
          .doc(id)
          .snapshots()
          .map(_eSportDetailsFromSnapshot);
    } else {
      return skillsCollection
          .doc(id)
          .snapshots()
          .map(_skillDetailsFromSnapshot);
    }
  }

//  Future<List<ActivityDetails>> activityDetailsForMarkers() async {
//    List<ActivityDetails> list = [];
//    QuerySnapshot snapshot = await sportsCollection.get();
//    snapshot.docs.forEach((document) {
//      list.add(ActivityDetails(
//        activityType: document.get('ActivityType'),
//        activityTitle: document.get('Name'),
//        long: document.get('Longitude') ?? '',
//        lat: document.get('Latitude') ?? '',
//        noOfPlayers: document.get('PlayersReq') ?? '',
//        description: document.get('Description'),
//        organiserID: document.get('OrganiserId'),
//        aid: document.id,
//      ));
//    });
//
//    return list;
//  }

//  Future<List<ActivityDetails>> nearestActivityDetailsForMarkers(
//      double lat, double long, int range) async {
//    List<ActivityDetails> list = [];
//    double diffValue = range * 0.005;
//    QuerySnapshot snapshot = await sportsCollection
//        .where('Latitude', isGreaterThanOrEqualTo: lat - diffValue)
//        .where('Latitude', isLessThanOrEqualTo: lat + diffValue)
////        .where('Longitude', isGreaterThanOrEqualTo: long - diffValue)
////        .where('Longitude', isLessThanOrEqualTo: long + diffValue)
//        .get();
//    snapshot.docs.forEach((document) {
//      double l = document.get('Longitude');
//      if ((long - diffValue) < l && (long + diffValue) > l) {
//        list.add(ActivityDetails(
//          activityType: document.get('ActivityType'),
//          activityTitle: document.get('Name'),
//          long: document.get('Longitude') ?? '',
//          lat: document.get('Latitude') ?? '',
//          noOfPlayers: document.get('PlayersReq') ?? '',
//          description: document.get('Description'),
//          organiserID: document.get('OrganiserId'),
//          aid: document.id,
//        ));
//      }
//    });
//
//    return list;
//  }

//  Future addRequest(String aid) async {
//    DocumentSnapshot document = await FirebaseFirestore.instance
//        .collection('ActivityPaticipation')
//        .doc(aid)
//        .get();
//    int req = 0, found = 0;
//    if (document.exists) {
//      req = document.get('Required');
//      found = document.get('Found');
//    }
//    if(found<req) {
//      return await FirebaseFirestore.instance
//          .collection('ActivityRequests')
//          .doc(aid)
//          .collection('requests')
//          .doc(uid)
//          .set({
//        'uid': uid,
//        'Accepted': 0,
//      });
//    }
//  }
}
