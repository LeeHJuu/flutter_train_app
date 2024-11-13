import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  String startStation;
  String endStation;

  SeatPage({
    required this.startStation,
    required this.endStation,
  });

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
            showSelectedStations(context),
            seatColorInfo(),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      seatLabel("A"),
                      seatLabel("B"),
                      SizedBox.square(dimension: 50),
                      seatLabel("C"),
                      seatLabel("D"),
                    ],
                  ),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                  seatRow(1),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "예매 하기",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget seatLabel(String label) {
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

  Row seatRow(int line) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seatItem(),
        seatItem(),
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
        seatItem(),
        seatItem(),
      ],
    );
  }

  Widget seatItem() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300]!,
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
          label("선택됨", Colors.purple),
          SizedBox(width: 20),
          label("선택안됨", Colors.grey[300]!),
        ],
      ),
    );
  }

  Row label(String text, Color color) {
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

  Row showSelectedStations(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "startStation",
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
            "endStation",
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
