import 'package:flutter/material.dart';
import 'package:youtube_tutorial/repository.dart';
import 'package:youtube_tutorial/user.dart';

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
  final Repository repo = Repository();
  User? user;

  Future getData() async {
    final data = await repo.getUsers();

    data.fold((l) {
      user = l;
      setState(() {});
    }, (r) {
      print(r.message);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        actions: [
          IconButton(onPressed: () => getData(), icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text((user?.id ?? 0).toString()),
            Text(user?.name ?? '...')
          ],
        ),
      ),
    );
  }
}
