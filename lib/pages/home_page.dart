import 'package:flutter/material.dart';
import 'package:train_1/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller= TextEditingController();

  List toDoList=
      [
        ['Learn Web',false],

      ];

  void checkBoxChanged(int index)
  {
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });
  }

  void saveNewTask()
  {
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
  }

  void deleteTask(int index)
  {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        title: const Text(
          'Simple ToDo List'
        ),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        centerTitle: true,

      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index)
          {
            return TodoList
              (
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (contex)=>checkBoxChanged(index),
              deleteFunction:(contex) => deleteTask(index),
            );

          }
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add a new task....',
                    filled: true,
                    fillColor: Colors.yellow.shade50,

                    enabledBorder:OutlineInputBorder(

                    borderSide: BorderSide(
                      color: Colors.yellow.shade200,
                    ),

                    borderRadius: BorderRadius.circular(10),
                  ) ,

                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),

                      borderRadius: BorderRadius.circular(20),
                    ) ,

                  ),

                ),

              )),

          FloatingActionButton(onPressed: saveNewTask,
          child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}


