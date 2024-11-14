import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';
import 'package:flutter_train_app/pages/station_list/station_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String startStation = "";
  String endStation = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("기차 예매"),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // color: Colors.white,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: stationBox("출발역", startStation)),
                  Container(
                    width: 2,
                    height: 50,
                    color: Theme.of(context).dividerColor,
                  ),
                  Expanded(child: stationBox("도착역", endStation)),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (startStation != "" && endStation != "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SeatPage(
                          startStation: startStation,
                          endStation: endStation,
                        );
                      }),
                    );
                  }
                },
                child: Text(
                  "좌석 선택",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stationBox(
    String title,
    String station,
  ) {
    return GestureDetector(
      onTap: () async {
        var selectedStation = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return StationListPage(title);
          }),
        );
        setState(() {
          // Todo: 반환하는 역이 없을 시의 예외처리.
          if (title == "출발역") startStation = selectedStation;
          if (title == "도착역") endStation = selectedStation;
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
}
