import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/model/Booking_history.dart';
import 'package:flutter_train_app/pages/widgets/seat_color_info.dart';
import 'package:flutter_train_app/pages/widgets/seat_list.dart';
import 'package:flutter_train_app/pages/widgets/selected_stations_display.dart';

class SeatPage extends StatefulWidget {
  String startStation;
  String endStation;

  SeatPage({
    required this.startStation,
    required this.endStation,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  List<String> selectedSeatList = [];

  void onTapSeatItem(String seat) {
    setState(() {
      if (selectedSeatList.contains(seat)) {
        selectedSeatList.remove(seat);
      } else {
        selectedSeatList.add(seat);
      }
      print(seat);
      print(selectedSeatList);
    });
  }

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
            selectedStationsDisplay(
                startStation: widget.startStation,
                endStation: widget.endStation),

            // 선택/미선택 좌석 컬러 안내
            SeatColorInfo(),

            // 좌석 배치
            SeatList(
                selectedSeatList: selectedSeatList,
                onTapSeatItem: onTapSeatItem),
                
            // 예매하기 버튼
            SizedBox(
              width: double.infinity,
              height: 56,
              child: bookingButton(context),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  ElevatedButton bookingButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 선택좌석 있는 경우만 동작.
        if (selectedSeatList.isNotEmpty) {
          showCupertinoDialog(
            context: context,
            builder: (context) {
              // Cupertino Dialog 출력
              return CupertinoAlertDialog(
                title: Text("예매하시겠습니까?"),
                content: Text("좌석 : ${selectedSeatList.toSet().join(", ")}"),
                actions: [
                  CupertinoDialogAction(
                    child: Text("취소"),
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      "확인",
                      style: TextStyle(color: Colors.blue),
                    ),
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(
                        context,
                        BookingHistory(
                            startStation: widget.startStation,
                            endStation: widget.endStation,
                            selectedSeatList: selectedSeatList),
                      );
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      child: Text(
        "예매 하기",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
