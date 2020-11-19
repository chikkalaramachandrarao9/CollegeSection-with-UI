class EventDetails {
  final String eventName,
      address,
      description,
      eligibility,
      eventType,
      otherDetails,
      timeOfEvent,
      posterUrl,
      dateOfEvent,
      eid;
  final double lat, long;

  EventDetails(
      {this.eventName,
      this.eid,
      this.address,
      this.description,
      this.eligibility,
      this.eventType,
      this.otherDetails,
      this.timeOfEvent,
      this.lat,
      this.long,
      this.posterUrl,
      this.dateOfEvent});
}

class Event {
  final String organiserID, eventId, eventType;
  final double lat, long;

  Event({
    this.organiserID,
    this.lat,
    this.long,
    this.eventId,
    this.eventType,
  });
}
class HomeData {
  final String eventname,eventType,time,posterurl;

  HomeData({
    this.eventname,
    this.eventType,
    this.posterurl,
    this.time
  });
}