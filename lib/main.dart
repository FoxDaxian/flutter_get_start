import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '标题',
      theme: new ThemeData(
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[200],
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('待办事项'),
        ),
        // 因为高度高出app设备，所以需要用 SingleChildScrollView 包裹一层
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                color: Colors.red,
                margin: EdgeInsets.only(top: 20.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text('待办事项'),
                  ],
                ),
              ),
              new TodoList(),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() {
    return new TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  var lists = <String>[
    '12',
    '123',
    '123',
    '123',
    '123',
    '123',
    '12',
    '123',
    '123',
    '123',
    '123',
    '123',
    '12',
    '123',
    '123',
    '123',
    '123',
    '123',
    '12',
    '123',
    '123',
    '123',
    '123',
    '123',
    '12',
    '123',
    '123',
    '123',
    '123',
    '123',
    '12',
    '123',
    '123',
    '123',
    '123',
    '123',
    '12',
    '123',
    '123',
    '123',
    '123',
    '123',
    '12',
    '123',
    '123',
    '123',
    '123',
    '123',
    '12',
    '123',
    '123',
    '123',
    '123',
    '123',
    '12',
    '123',
    '123',
    '123',
    '123',
    '123',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      itemCount: lists.length,
      itemBuilder: (BuildContext context, int index) {
        return new Text('$index');
      },
    );
  }
}
