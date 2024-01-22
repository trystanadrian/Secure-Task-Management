import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/core/helper/db_helper.dart';
import 'package:todo_app/core/res/colours.dart';
import 'package:todo_app/features/todo/models/task_model.dart';

part 'task_provider.g.dart';

@riverpod
class Task extends _$Task {
  @override
  List<TaskModel> build() => [];

  void refresh() async {
    final data = await DBHelper.getTasks();
    state = data.map((taskData) {
      return TaskModel.fromMap(taskData);
    }).toList();
  }

  Future<int> addTask(TaskModel task) async {
    final taskId = await DBHelper.addTask(task);
    refresh();
    return taskId;
  }

  Future<void> deleteTask(int taskId) async {
    await DBHelper.deleteTask(taskId);
    refresh();
  }

  Future<void> updateTask(TaskModel task) async {
    await DBHelper.updateTask(task);
    refresh();
  }

  Future<void> markAsCompleted(TaskModel task) async {
    await updateTask(task);
  }
}
