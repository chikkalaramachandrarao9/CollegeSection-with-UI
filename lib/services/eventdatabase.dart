import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yibe_final_ui/models/event.dart';

class EventDatabaseService {
  final CollectionReference eventCollection =
      FirebaseFirestore.instance.collection('Events');

  final CollectionReference detailsCollection =
      FirebaseFirestore.instance.collection('EventDetails');

  List<Event> _eventsFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Event(
        organiserID: doc.get('OrganiserId'),
        lat: doc.get('Latitude'),
        long: doc.get('Longitude'),
        eventType: doc.get('EventType'),
        eventId: doc.get('EventID'),
      );
    }).toList();
  }

  Stream<List<Event>> getEvents(int type) {
    List<String> EventTypes = ['all', 'college', 'Music', 'Party'];
    if (type == 0) {
      return eventCollection
          .orderBy('TimeOfRegistration', descending: true)
          .snapshots()
          .map(_eventsFromSnapshots);
    } else {
      return eventCollection
          .where('EventTy`pe', isEqualTo: EventTypes[type])
          .orderBy('TimeOfRegistration', descending: true)
          .snapshots()
          .map(_eventsFromSnapshots);
    }
  }

  EventDetails _detailsFromSnapshot(DocumentSnapshot snapshot) {
    return EventDetails(
        eventName: snapshot.get('Name'),
        address: snapshot.get('Address'),
        description: snapshot.get('Description'),
        eligibility: snapshot.get('Eligibility'),
        eventType: snapshot.get('EventType'),
        otherDetails: snapshot.get('OtherDetails'),
        timeOfEvent: snapshot.get('TimeOfEvent'),
        lat: snapshot.get('Latitude'),
        long: snapshot.get('Longitude'),
        posterUrl: snapshot.get('PosterUrl'),
        dateOfEvent: snapshot.get('DateOfEvent'),
        eid: snapshot.id);
  }

  Stream<EventDetails> getEventDetails(String id) {
    return detailsCollection.doc(id).snapshots().map(_detailsFromSnapshot);
  }

  Future<List<EventDetails>> eventDetailsForMarkers() async {
    List<EventDetails> list = [];
    List<String> addresses = [];
    QuerySnapshot snapshot = await eventCollection.get();
    print(snapshot.size);
    snapshot.docs.forEach((document) {
      addresses.add(document.get('EventID'));
    });

    for (int i = 0; i < addresses.length; i++) {
      DocumentSnapshot doc = await detailsCollection.doc(addresses[i]).get();
      list.add(EventDetails(
        eventName: doc.get('Name'),
        address: doc.get('Address'),
        description: doc.get('Description'),
        eligibility: doc.get('Eligibility'),
        eventType: doc.get('EventType'),
        otherDetails: doc.get('OtherDetails'),
        timeOfEvent: doc.get('TimeOfEvent'),
        lat: doc.get('Latitude'),
        long: doc.get('Longitude'),
        posterUrl: doc.get('PosterUrl'),
        dateOfEvent: doc.get('DateOfEvent'),
        eid: doc.id,
      ));
    }
    return list;
  }

//  Future addRegistration(String eid) async {
//    return await FirebaseFirestore.instance
//        .collection('EventRequests')
//        .doc(eid)
//        .collection('requests')
//        .doc(uid)
//        .set({
//      'uid': uid,
//    });
//  }
}
