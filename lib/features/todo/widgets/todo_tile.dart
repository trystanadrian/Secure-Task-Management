import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/common/widgets/fading_text.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/core/extensions/date_extensions.dart';
import 'package:todo_app/core/res/colours.dart';
import 'package:todo_app/core/services/notification_service.dart';
import 'package:todo_app/features/todo/app/task_provider.dart';
import 'package:todo_app/features/todo/models/task_model.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile(
    this.task, {
    required this.endIcon,
    super.key,
    this.onEdit,
    this.bottomMargin,
    this.colour,
  });

  final TaskModel task;
  final VoidCallback? onEdit;
  final Widget endIcon;
  final double? bottomMargin;
  final Color? colour;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: bottomMargin == null
          ? null
          : EdgeInsets.only(bottom: bottomMargin!.h),
      decoration: BoxDecoration(
        color: Colours.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 80.h,
                width: 5.w,
                decoration: BoxDecoration(
                  color: colour ?? Colours.randomColour(),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const WhiteSpace(width: 15),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadingText(
                      task.title!,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const WhiteSpace(height: 3),
                    FadingText(
                      task.description!,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const WhiteSpace(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 3.h,
                            horizontal: 15.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colours.darkBackground,
                            border: Border.all(
                              width: .3,
                              color: Colours.darkGrey,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              '${task.startTime!.timeOnly} |'
                              ' ${task.endTime!.timeOnly}',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colours.light,
                              ),
                            ),
                          ),
                        ),
                        if (!task.isCompleted)
                          IconButton(
                            onPressed: onEdit,
                            icon: const Icon(
                              MaterialCommunityIcons.circle_edit_outline,
                              color: Colours.light,
                            ),
                          ),
                        IconButton(
                          onPressed: () {
                            ref.read(taskProvider.notifier).deleteTask(task.id!);
                            NotificationService.cancelNotification(task.id!);
                          },
                          icon: const Icon(
                            MaterialCommunityIcons.delete_circle,
                            color: Colours.light,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          endIcon,
        ],
      ),
    );
  }
}
