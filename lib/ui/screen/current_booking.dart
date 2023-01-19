import 'package:flutter/material.dart';

class CurrentBokingScreen extends StatefulWidget {
  const CurrentBokingScreen({super.key});

  @override
  State<CurrentBokingScreen> createState() => _CurrentBokingScreenState();
}

class _CurrentBokingScreenState extends State<CurrentBokingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF9F7F7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, left: 33, right: 30, bottom: 30),
            child: SizedBox(
              height: 460,
              width: 320,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFA2A5FD),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Department : ",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        "Doctor : ",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        "Token Number : ",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Text(
                        "Current Token: ",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
