import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mileage_app/data.dart';
import 'package:bidirectional_scroll_view/bidirectional_scroll_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xfff2f3f7),
          backgroundColor: Color(0xfff2f3f7),
          accentColor: Colors.blue,
          cursorColor: Colors.blue,
          scaffoldBackgroundColor: Color(0xfff2f3f7),
        ),
        home: MainPage(),
      );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Fees Structure'),
        ),
        body: DataTableWidget(),
      );
}

class DataTableWidget extends StatefulWidget {
  @override
  _DataTableWidgetState createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  @override
  Widget build(BuildContext context) {
    return BidirectionalScrollViewPlugin(
      child: DataTable(
        columns: courseRows
            .map(
              (String column) => DataColumn(
                label: Center(child: Text(column)),
              ),
            )
            .toList(),
        rows: courses
            .map(
              (CourseNames coursenames) => DataRow(
                cells: [
                  DataCell(Text('${coursenames.courseName}')),
                  DataCell(
                    Center(child: Text('${coursenames.total}')),
                  ),
                  DataCell(Center(child: Text('${coursenames.admissionFees}'))),
                  DataCell(
                      Center(child: Text('${coursenames.cautionDeposit}'))),
                  DataCell(Center(
                      child: Text('${coursenames.infrastructureManagement}'))),
                  DataCell(Center(child: Text('${coursenames.tuitionFees}'))),
                  DataCell(Center(child: Text('${coursenames.examFees}'))),
                  DataCell(Center(
                      child: Text('${coursenames.studentActivitiesFees}'))),
                  DataCell(
                      Center(child: Text('${coursenames.healthInsurance}'))),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
