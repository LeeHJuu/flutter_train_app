import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/station_list/station_list.dart';

class StationListPage extends StatelessWidget {
  String title;
  StationListPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        children: [
          // stationItem("무슨역"),
          // stationItem("무슨역"),
          // stationItem("무슨역"),
          // stationItem("무슨역"),
          // stationItem("무슨역"),
          // stationItem("무슨역"),
          // stationItem("무슨역"),
          // stationItem("무슨역"),
          // stationItem("무슨역"),
          // stationItem("무슨역"),
          // stationItem("무슨역"),
          for (String station in stationList) stationItem("${station}", context),
        ],
      ),
    );
  }

  Widget stationItem(
    String station,
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
            Navigator.pop(context, station);
          },
          child: Text(
            station,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
