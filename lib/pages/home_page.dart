import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/database.dart';
import '../util/to_do_list.dart';
import '../util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoAppDataBase db = ToDoAppDataBase();

  @override
  void initState() {
    // if this is the first time ever opening the app, then create default data
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      // if there already exist data
      db.loadData();
    }

    super.initState();
  }

  final newTaskController = TextEditingController();

  void onChanged(bool value, int index) {
    setState(() {
      db.taskList[index][1] = value;
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.taskList.add([newTaskController.text, false]);
    });
    Navigator.pop(context);
    newTaskController.clear();
    db.updateData();
  }

  void onCancel() {
    Navigator.pop(context);
    newTaskController.clear();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: newTaskController,
          onSave: saveNewTask,
          onCancel: onCancel,
        );
      },
    );
  }

  void onDelete(int index) {
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFAED2FF),
        appBar: AppBar(
          title: const Text(
            'TO DO APP',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF7091F5),
          onPressed: addNewTask,
          child: const Icon(Icons.add),
        ),
        body: ToDoList(
          taskList: db.taskList,
          onChanged: onChanged,
          onDelete: onDelete,
        ),
      ),
    );
  }
}
