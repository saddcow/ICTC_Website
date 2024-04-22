import 'package:flutter/material.dart';

class Placer extends StatefulWidget {
  final Widget child;

  const Placer({Key? key, required this.child}) : super(key: key);

  @override
  State<Placer> createState() => _PlacerState();
}

class _PlacerState extends State<Placer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.black.withOpacity(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: widget.child, 
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
