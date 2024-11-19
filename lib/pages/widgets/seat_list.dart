import 'package:flutter/material.dart';

class SeatList extends StatefulWidget {
  List<String> selectedSeatList;
  void Function(String seat)? onTapSeatItem;

  SeatList({
    required this.selectedSeatList,
    required this.onTapSeatItem,
  });

  @override
  State<SeatList> createState() => _SeatListState();
}

class _SeatListState extends State<SeatList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          // 좌석 인덱스 안내
          seatLabelRow(),

          // 반복문으로 20줄의 좌석 배치.
          for (var i = 1; i <= 20; i++) seatRow(i, context),
        ],
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
        widget.selectedSeatList.contains("${line}-${label}") ? true : false;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: GestureDetector(
        onTap: () {
          if (widget.onTapSeatItem != null) {
            widget.onTapSeatItem!("${line}-${label}");
          }
        },
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
      ),
    );
  }
}
