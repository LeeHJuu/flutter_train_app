import 'package:flutter/material.dart';
import 'package:flutter_train_app/model/Booking_history.dart';
import 'package:flutter_train_app/pages/booking_history_page.dart';

class BookingHistoryListPage extends StatelessWidget {
  List<BookingHistory> bookingHistoryList;

  BookingHistoryListPage(this.bookingHistoryList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("좌석 예매 기록"),
      ),
      body: Column(
        children: [
          // 역 리스트 출력(역순으로)
          for (BookingHistory history in bookingHistoryList.reversed)
            historyItem(history, context),
        ],
      ),
    );
  }

  Widget historyItem(
    BookingHistory history,
    BuildContext context,
  ) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return BookingHistoryPage(history);
              }),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${history.startStation} - ${history.endStation}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(history.dateTime.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
