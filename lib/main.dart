import 'package:flutter/material.dart';
import 'package:youtube_tutorial/people.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int sortIndex = 0;
  bool isAscending = true;
  List<People> people = [
    People(name: 'Budi', age: 17),
    People(name: 'Tono', age: 47),
    People(name: 'Andri', age: 23),
    People(name: 'Lina', age: 67),
    People(name: 'Lutfi', age: 10),
    People(name: 'Rani', age: 40),
    People(name: 'Sari', age: 29),
    People(name: 'Mudi', age: 32),
    People(name: 'Lisa', age: 25),
  ];

  sortData() {
    if (sortIndex == 0) {
      people.sort((a, b) {
        if (isAscending) {
          return a.name
              .toString()
              .toLowerCase()
              .compareTo(b.name.toString().toLowerCase());
        } else {
          return b.name
              .toString()
              .toLowerCase()
              .compareTo(a.name.toString().toLowerCase());
        }
      });
    } else {
      people.sort((a, b) {
        if (isAscending) {
          return a.age
              .toString()
              .toLowerCase()
              .compareTo(b.age.toString().toLowerCase());
        } else {
          return b.age
              .toString()
              .toLowerCase()
              .compareTo(a.age.toString().toLowerCase());
        }
      });
    }
  }

  void onSort(columnIndex, ascending) {
    sortIndex = columnIndex;
    isAscending = ascending;
    sortData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter')),
        body: SizedBox(
            width: double.infinity,
            child: DataTable(
                sortColumnIndex: sortIndex,
                sortAscending: isAscending,
                columns: [
                  DataColumn(onSort: onSort, label: Text('Nama')),
                  DataColumn(onSort: onSort, label: Text('Umur')),
                ],
                rows: people
                    .map((e) => DataRow(cells: [
                          DataCell(Text(e.name ?? '')),
                          DataCell(Text(e.age.toString())),
                        ]))
                    .toList())));
  }
}
