import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/core/extensions/date_extensions.dart';
import 'package:todo_app/core/res/colours.dart';
import 'package:todo_app/core/res/image_res.dart';
import 'package:todo_app/features/todo/models/task_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen(this.notificationTask, {super.key});

  final TaskModel notificationTask;

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colours.darkBackground,
    );

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colours.light,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(12),
              height: size.height * .7,
              decoration: BoxDecoration(
                color: Colours.lightBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengingat',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      color: Colours.light,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const WhiteSpace(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 5.w),
                    decoration: BoxDecoration(
                      color: Colours.yellow,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Row(
                      children: [
                        Text(
                          notificationTask.date!.dateOnly,
                          style: style.copyWith(
                            fontSize: 15,),
                        ),
                        const WhiteSpace(width: 20),
                        Text(
                          'Waktu : ${notificationTask.startTime!.timeOnly} - '
                          '${notificationTask.endTime!.timeOnly}',
                          style: style.copyWith(
                            fontSize: 15,),
                        ),
                      ],
                    ),
                  ),
                  const WhiteSpace(height: 10),
                  Text(
                    notificationTask.title!,
                    style: style.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const WhiteSpace(height: 10),
                  Text(
                    notificationTask.description!,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colours.light,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                ImageRes.bell,
                width: 80.w,
                height: 80.h,
              ),
            ),
            Positioned(
              bottom: -(size.height * .143),
              left: 0,
              right: 0,
              child: Image.asset(
                ImageRes.notification,
                width: size.width * .8,
                height: size.height * .6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
