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
        body: new TodoList(),
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
  var todoLists = <Map>[];
  var todoInput = new TextEditingController(text: '');
  var todoFocus = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(12.0),
      child: new Flex(
        direction: Axis.vertical,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 20.0),
            child: new TextField(
              focusNode: todoFocus,
              keyboardType: TextInputType.text,
              controller: todoInput,
              decoration: new InputDecoration(
                labelText: '想做的事情',
                hintText: '这里输入',
                prefixIcon: new Icon(Icons.access_time),
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.only(
              right: 20.0,
              top: 20.0,
              bottom: 20.0,
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.add),
                  onPressed: () {
                    if (todoInput.text != '') {
                      setState(() {
                        var m = new Map();
                        m['value'] = todoInput.text;
                        m['finised'] = false;
                        todoLists.insert(0, m);
                        todoInput.text = '';
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          new Container(
            child: new Expanded(
              child: new ListView.builder(
                itemCount: todoLists.length,
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(
                    onTap: () {
                      setState(() {
                        if (todoLists[index]['finised'] == false) {
                          todoLists[index]['finised'] =
                              !todoLists[index]['finised'];
                          var temp = todoLists.removeAt(index);
                          todoLists.insert(todoLists.length, temp);
                        } else {
                          todoLists[index]['finised'] =
                              !todoLists[index]['finised'];
                          var temp = todoLists.removeAt(index);
                          todoLists.insert(0, temp);
                        }
                      });
                    },
                    child: new Container(
                      color: todoLists[index]['finised'] == true
                          ? Colors.green[400]
                          : Colors.red[400],
                      margin: EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: new Wrap(
                        children: <Widget>[
                          // 内容部分
                          new Text(
                            '${index + 1}: ${todoLists[index]['value']}',
                            style: new TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new IconButton(
                                color: Colors.white,
                                icon: new Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    todoLists.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
