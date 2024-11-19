import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/station_list.dart';

class StationListPage extends StatelessWidget {
  String title;
  String selectedStation;

  StationListPage(this.title, this.selectedStation);

  @override
  Widget build(BuildContext context) {
    // 출발/도착역 필터링
    List<String> filteredStationList = [...stationList];
    filteredStationList.remove(selectedStation);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        children: [
          // 역 리스트 출력
          for (String station in filteredStationList)
            stationItem("${station}", context),
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
