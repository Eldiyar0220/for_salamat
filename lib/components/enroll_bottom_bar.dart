import 'package:dimplom/model/course/course_viewmodel.dart';
import 'package:dimplom/model/profile/profile_viewmodel.dart';
import 'package:dimplom/screens/course/my_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnrollBottomBar extends StatelessWidget {
  const EnrollBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final course = Provider.of<CourseViewModel>(context);
    final user = Provider.of<ProfileViewModel>(context);
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(62, 158, 158, 158),
            blurRadius: 15,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          onPressed: () async {
            await course.enrollCourse(user.userData.id!, course.courseData.id!);
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyCourseScreen(),
              ),
              // MaterialPageRoute(
              //   builder: (context) => LearningCourseScreen(
              //     courseId: course.courseData,
              //     initURL: course.courseData.sections?[0].materials?[0].url,
              //   ),
              // ),
            );
          },
          child: const Text('ENROLL COURSE'),
        ),
      ),
    );
  }
}
