import 'package:flutter/material.dart';
import 'package:flutter_train_app/model/Booking_history.dart';
import 'package:flutter_train_app/pages/booking_history_list_page.dart';
import 'package:flutter_train_app/pages/seat_page.dart';
import 'package:flutter_train_app/pages/station_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String startStation = "";
  String endStation = "";

  List<BookingHistory> bookingHistoryList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("기차 예매"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return BookingHistoryListPage(bookingHistoryList);
              }),
            );
            },
            icon: Icon(Icons.history_edu),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).hintColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 출발역 - 도착역 선택 박스
            stationSelectionContainer(context),

            SizedBox(height: 20),

            // 좌석 선택 버튼
            SizedBox(
              width: double.infinity,
              height: 56,
              child: goToSeatSelectionButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Container stationSelectionContainer(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).canvasColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: stationSelectionBox("출발역", startStation)),
          Container(
            width: 2,
            height: 50,
            color: Theme.of(context).dividerColor,
          ),
          Expanded(child: stationSelectionBox("도착역", endStation)),
        ],
      ),
    );
  }

  Widget stationSelectionBox(
    String title,
    String station,
  ) {
    return GestureDetector(
      onTap: () async {
        var selectedStation = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            var oppositeStaton;
            if (title == "출발역") oppositeStaton = endStation;
            if (title == "도착역") oppositeStaton = startStation;
            return StationListPage(title, oppositeStaton);
          }),
        );
        setState(() {
          if (title == "출발역" && selectedStation != null)
            startStation = selectedStation;
          if (title == "도착역" && selectedStation != null)
            endStation = selectedStation;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          Text(
            station == "" ? "선택" : station,
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }

  ElevatedButton goToSeatSelectionButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (startStation != "" && endStation != "") {
          BookingHistory? history = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return SeatPage(
                startStation: startStation,
                endStation: endStation,
              );
            }),
          );

          if (history != null) bookingHistoryList.add(history);
          print(bookingHistoryList);
        }
      },
      child: Text(
        "좌석 선택",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
