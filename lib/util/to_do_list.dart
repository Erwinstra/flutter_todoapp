import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final List taskList;
  final Function onChanged;
  final Function onDelete;
  const ToDoList({
    super.key,
    required this.taskList,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        var checkboxValue = taskList[index][1];
        var task = taskList[index][0];
        return Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(10),
                onPressed: (context) => onDelete(index),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xFFE4F1FF),
            ),
            child: CheckboxListTile(
              value: checkboxValue,
              onChanged: (value) => onChanged(value, index),
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                task,
                style: TextStyle(
                  decoration: checkboxValue ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
    );
  }
}
