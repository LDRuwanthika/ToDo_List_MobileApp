import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.taskName,
    required this.taskCompleted,
    required  this.onChanged,
    required this.deleteFunction});

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)?onChanged;
  final Function(BuildContext)? deleteFunction;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only
        (
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),

      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                  borderRadius: BorderRadius.circular(10),

              ),
          ],
        ),



        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(15),
        
          ),
          child: Row(
            children: [
              Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  checkColor: Colors.white,
                   activeColor: Colors.black,
        
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  decoration: taskCompleted ?
                  TextDecoration.lineThrough:TextDecoration.none,
        
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

}




