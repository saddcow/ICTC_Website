import 'package:flutter/material.dart';

class CharacteristicsCard extends StatelessWidget {
  const CharacteristicsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 360,
        height: 388,
        child: Card(
          child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Icon(
                  Icons.center_focus_strong,
                  size: 100
                ),
                Padding(padding: EdgeInsets.all(20)),
                Text(
                  'Focused Content',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  'Micro-credentials concentrate on specific, well-defined skills or knowledge in a particular field, providing learners with the opportunity to gain targeted expertise without delving into unrelated subjects.',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),
                  )
              ],
            ),
          )
        )
      ),
    );
  }
}