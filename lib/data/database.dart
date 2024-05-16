import 'package:hive_flutter/hive_flutter.dart';

class ToDoAppDataBase {
  List taskList = [];

  // reference to our box
  final _myBox = Hive.box('mybox');

  // data first time
  void createInitialData() {
    taskList = [
      ['Welcome to TODOAPP!', false],
      ['Your task list will be here', false],
    ];
  }

  // load data
  void loadData() {
    taskList = _myBox.get('TODOLIST');
  }

  // update data
  void updateData() {
    _myBox.put('TODOLIST', taskList);
  }
}
