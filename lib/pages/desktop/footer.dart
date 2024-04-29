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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 180),
        child: Row(
          children: [
            Column(
              children:[
              aboutUs()
              ]
            ),
          Column(
            children:[
              location()
            ]
          ), 
          Column(
            children:[
              contact()
            ]
          ),
        ],
        
        ),
      )

    );
  }
}

Widget aboutUs() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'ABOUT US',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        "Information and Communications Technology Center is Ateneo de Naga's Professional School for ICT and the Premier IT Training Center in Southern Luzon, Philippines.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      )
    ],
  );
}

Widget location() {
  return Column(
    children: [
      Text("WHERE TO FIND US",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
    ],
  );
}

Widget contact() {
  return Column(
    children: [
      Text("CONTACT US",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
    ],
  );
}