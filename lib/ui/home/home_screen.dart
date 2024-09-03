import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Column(
            children: [
              // Image.asset('name'),
              Row(
                children: [
                  TextField(
                    // border: BorderRadius.circular(15),

                    decoration:
                        // OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(15)
                        // ),

                        InputDecoration(
                      hintText: 'What do you search for?',
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
