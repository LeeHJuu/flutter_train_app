import 'package:flutter/material.dart';
import 'package:flutter_train_app/model/Booking_history.dart';

class BookingHistoryPage extends StatefulWidget {
  BookingHistory bookingHistory;

  BookingHistoryPage(this.bookingHistory);

  @override
  State<BookingHistoryPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<BookingHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("좌석 선택"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 출발역 - 도착역 표시
            selectedStationsDisplay(context),

            // 선택/미선택 좌석 컬러 안내
            seatColorInfo(),

            Expanded(
              child: ListView(
                children: [
                  // 좌석 인덱스 안내
                  seatLabelRow(),

                  // 반복문으로 20줄의 좌석 배치.
                  for (var i = 1; i <= 20; i++) seatRow(i, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row seatLabelRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seatColumnLabel("A"),
        seatColumnLabel("B"),
        SizedBox.square(dimension: 50),
        seatColumnLabel("C"),
        seatColumnLabel("D"),
      ],
    );
  }

  Widget seatColumnLabel(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: SizedBox.square(
        dimension: 50,
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Row seatRow(
    int line,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seatItem(line, "A", context),
        seatItem(line, "B", context),
        SizedBox.square(
          dimension: 50,
          child: Center(
            child: Text(
              line.toString(),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        seatItem(line, "C", context),
        seatItem(line, "D", context),
      ],
    );
  }

  Widget seatItem(
    int line,
    String label,
    BuildContext context,
  ) {
    bool selected =
        widget.bookingHistory.selectedSeatList.contains("${line}-${label}") ? true : false;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).highlightColor
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget seatColorInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          colorInfoItem("선택됨", Theme.of(context).highlightColor),
          SizedBox(width: 20),
          colorInfoItem("선택안됨", Theme.of(context).cardColor),
        ],
      ),
    );
  }

  Row colorInfoItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8)),
        ),
        SizedBox(width: 4),
        Text(text),
      ],
    );
  }

  Row selectedStationsDisplay(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.bookingHistory.startStation,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).highlightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Icon(
          Icons.arrow_circle_right_outlined,
          size: 30,
        ),
        Expanded(
          child: Text(
            widget.bookingHistory.endStation,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).highlightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
