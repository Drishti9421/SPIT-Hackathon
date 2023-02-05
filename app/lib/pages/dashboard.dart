import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                "Hetvi's Dashboard",
                style: TextStyle(fontSize: 36, fontFamily: 'Poppins'),
              ),
            ),
            Container(
              height: 650,
              margin: EdgeInsets.only(top: 30),
              color: Colors.white,
              child: SfCartesianChart(
                plotAreaBorderWidth: 10,
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(),
                series: <ChartSeries>[
                  ColumnSeries<UserData, String>(
                      dataSource: getColumnData(),
                      xValueMapper: (UserData users, _) => users.x,
                      yValueMapper: (UserData users, _) => users.y,
                      name: "Hetvi's Dashboard")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserData {
  String x;
  double y;
  UserData(this.x, this.y);
}

dynamic getColumnData() {
  List<UserData> columnData = <UserData>[
    UserData("You", 20),
    UserData("Vinit", 25),
    UserData("Avsih", 20),
    UserData("Drishti", 20)
  ];
  return columnData;
}
