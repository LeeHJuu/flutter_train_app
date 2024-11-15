class BookingHistory {
  String startStation;
  String endStation;
  List<String> selectedSeatList;

  BookingHistory({
    required this.startStation,
    required this.endStation,
    required this.selectedSeatList,
  });

  @override
  String toString() {
    // TODO: implement toString
    return "bookingHistory: {startStation: $startStation, endStation: $endStation, selectedSeatList: [${selectedSeatList.join(",")}]}";
  }
}
