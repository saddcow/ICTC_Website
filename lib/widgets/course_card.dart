import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.blue,
                  size: 20,
                ),
                Column(
                  children: [
                    Text("Course Name"),
                    Text("Course Price"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Lorem ipsum dolor sit amet chuchu chuchuness"),
            SizedBox(
              height: 40,
            ),
            FilledButton(onPressed: () {}, child: Text("Here"))
          ],
        ),
      ),
    );
  }
}
