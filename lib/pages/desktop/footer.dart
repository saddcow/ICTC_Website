import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      width: MediaQuery.of(context).size.width,
      height: 300,
      color: Color(0xff153faa),
      child: Row(
        children: [
          Column(
            children:[
              Icon(),
          ]
        ), Column(children:[]), Column(children:[]),],

      )

    );
  }
}