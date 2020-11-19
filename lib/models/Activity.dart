class Activity {
  final String organiserID, activityId, activityType;

  Activity({
    this.organiserID,
    this.activityId,
    this.activityType,
  });
}

class ActivityDetails {
  final String activityTitle, description, activityType, organiserID, aid;
  final double lat, long;
  int noOfPlayers;

  ActivityDetails(
      {this.activityTitle,
      this.description,
      this.activityType,
      this.noOfPlayers,
      this.lat,
      this.long,
      this.organiserID,
      this.aid});
}
