import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(
                      "ABOUT US",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                    Divider(color: Colors.white),
                    Text(
                      "Information and Communications Technology Center is",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "Ateneo de Naga's Professional School for ICT and the",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "Premier IT Training Center in Southern Luzon, Philippines.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),

                    SizedBox(height: 20),

                    Text("ICTC also renders the Graduate Programs of the College of Computer Studies.", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),

                    SizedBox(height: 20),

                    Text("Copyright © 2024 ICTC • Ateneo de Naga University", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      )
                    ),
                  ]
                ),
              ),
            ),

            SizedBox(width: 30),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                        "WHERE TO FIND US",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      Divider(color: Colors.white),
                      Text(
                        "Ateneo Main Campus",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      Text("Bagumbayan Sur, Ateneo Avenue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      Text("Naga City, 4400",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ]
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("OFFICE HOURS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      Divider(color: Colors.white),
                      Text(
                        "Monday-Friday: 8:00-12:00nn, 1:00-5:00pm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ), 

            SizedBox(width: 30),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(
                    "CONTACT US",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  Divider(color: Colors.white),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "(054) 881.23.68 local 2054",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "ictc@gbox.adnu.edu.ph",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      IconButton(
                        onPressed:(){
                          launch("https://www.facebook.com/ateneoictc");
                        }, 
                        icon: Icon(
                          Icons.facebook, color: Colors.white, size: 30,
                        )
                      ),
                    ],
                  )
                ]
              ),
            ),
          ],
        ),
      )
    );
  }
}

