import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/res/colours.dart';
import 'package:todo_app/core/services/notification_service.dart';
import 'package:todo_app/features/todo/app/task_provider.dart';
import 'package:todo_app/features/todo/utils/todo_utils.dart';
import 'package:todo_app/features/todo/views/add_task_screen.dart';
import 'package:todo_app/features/todo/widgets/task_expansion_tile.dart';
import 'package:todo_app/features/todo/widgets/todo_tile.dart';

class TasksForTomorrow extends ConsumerWidget {
  const TasksForTomorrow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);
    return FutureBuilder(
      future: TodoUtils.getTasksForTomorrow(tasks),
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final colour = Colours.randomColour();
          return TaskExpansionTile(
            title: "Task Besok",
            colour: colour,
            subtitle: "Task besok ada disini",
            children: snapshot.data!.map((task) {
              final isLast = snapshot.data!
                      .indexWhere((element) => element.id == task.id) ==
                  snapshot.data!.length - 1;
              return TodoTile(
                task,
                colour: colour,
                bottomMargin: isLast ? null : 10,
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddOrEditTaskScreen(task: task),
                    ),
                  );
                },
                endIcon: Switch(
                  value: task.isCompleted,
                  onChanged: (_) async {
                    task.isCompleted = true;
                    await ref.read(taskProvider.notifier).markAsCompleted(task);
                    NotificationService.cancelNotification(task.id!);
                  },
                ),
              );
            }).toList(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
