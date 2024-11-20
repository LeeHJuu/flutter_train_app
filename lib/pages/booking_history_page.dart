import 'package:flutter/material.dart';
import 'package:flutter_train_app/model/Booking_history.dart';
import 'package:flutter_train_app/pages/widgets/seat_color_info.dart';
import 'package:flutter_train_app/pages/widgets/seat_list.dart';
import 'package:flutter_train_app/pages/widgets/selected_stations_display.dart';
import 'package:intl/intl.dart';

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
        title: Text(
            "예매 기록 - ${DateFormat("yyyy-MM-dd hh:mm").format(widget.bookingHistory.dateTime)}"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 출발역 - 도착역 표시
            selectedStationsDisplay(
                startStation: widget.bookingHistory.startStation,
                endStation: widget.bookingHistory.endStation),

            // 선택/미선택 좌석 컬러 안내
            SeatColorInfo(),

            // 좌석 배치
            SeatList(
              selectedSeatList: widget.bookingHistory.selectedSeatList,
              onTapSeatItem: (String seat) {},
            ),
          ],
        ),
      ),
    );
  }
}
