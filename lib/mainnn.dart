import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'todo_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  final _linearGradiant = LinearGradient(
    colors: [Color(0xffe2d810), Color(0xff077b8a)],
    stops: [0.2, 0.8],
  );

  final _formkey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final List<Todo> todos = [];
  final date = DateFormat('MM/dd/yyyy').format(DateTime.now());

  void showTaskDialog(BuildContext context){
    var alert = AlertDialog(
      title: Text('Add title of task :'),
      content: SizedBox(
        child: Form(
          key: _formkey,
          child: TextFormField(
            textInputAction: TextInputAction.search,
            validator: (value)=>
              value.isEmpty ? 'Entry cannot be empty' : null,
            cursorColor: Colors.deepPurple,
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'TODO',
              hintText: 'What to do today',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              prefixIcon: Icon(Icons.work),
            ),
          ),
        ),
      ),
      actions: [TextButton(onPressed: (){
        setState(() {
          if(_formkey.currentState.validate()){
            todos.add(Todo(title:  _controller.text,isDone: false));
            _controller.clear();
            Navigator.pop(context);
          }
        });
      },
          child: Text('Add'))],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  @override
  Widget build(BuildContext context){
    TimeOfDay timeOfDay = TimeOfDay.fromDateTime(DateTime.now());
    String time = timeOfDay.format(context);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.work),
        elevation: 0.0,
        title: Text("Todo App"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: _linearGradiant,
          ),
        ),
      ),
      backgroundColor: Colors.deepPurple,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            showTaskDialog(context);
          },
          label: Text("Add "),
          tooltip: 'Adding',
          backgroundColor: Color(0xffe2d810),
          icon: Icon(Icons.add),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: _linearGradiant,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              child: Column(
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      date,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff077b8a),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50)
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 30, left: 10, right: 0),
                        child: ListView.builder(
                          itemBuilder: (context, index){
                            return Padding(
                                padding: EdgeInsets.all(5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(10,10),
                                      color: Colors.purpleAccent,
                                      blurRadius: 20
                                    ),
                                    BoxShadow(
                                        offset: Offset(-10,-10),
                                        color: Colors.blue,
                                        blurRadius: 20
                                    )
                                  ]
                                ),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.arrow_right, color: Colors.blue,
                                  ),
                                  title: Text(todos[index].title,style: TextStyle(
                                            decoration: todos[index].isDone ?
                                                TextDecoration.lineThrough :
                                                TextDecoration.none
                                          ),
                                  ),
                                  trailing: ButtonBar(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Tooltip(
                                          message: 'Done',
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.check_box,
                                                color: todos[index].isDone ?
                                                Colors.green :
                                                Colors.red,
                                              ),
                                              onPressed: (){
                                                setState(() =>
                                                todos[index].isDone = !todos[index].isDone,
                                                );
                                              }
                                          )
                                      ),
                                      Tooltip(
                                          message: 'Delete',
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              onPressed: (){
                                                setState(() =>
                                                  todos.removeAt(index)
                                                );
                                              }
                                          )
                                      )
                                    ]
                                  ),
                                ),
                              ),
                            );
                          },
                            itemCount: todos.length,
                        ),
                      ),
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}










