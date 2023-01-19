import 'package:flutter/material.dart';

class Token extends StatelessWidget {
  const Token({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF9F7F7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Current Token Number',
              textAlign: TextAlign.left,
              style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 20,
                    color: Color.fromARGB(100, 0, 0, 0),
                  )
                ],
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Center(child: TokenItem()),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'My Token Number',
              textAlign: TextAlign.left,
              style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 20,
                    color: Color.fromARGB(100, 0, 0, 0),
                  )
                ],
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(child: TokenItem()),
        ],
      ),
    );
  }
}

class TokenItem extends StatelessWidget {
  const TokenItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: const BoxDecoration(
        color: Color(0xFF797EF6),
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Text(
          '10',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
