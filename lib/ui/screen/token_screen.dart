import 'package:flutter/material.dart';

class Token extends StatelessWidget {
  const Token({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Image.asset(
              "assets/image/bg.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 140,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 145,
                    width: double.infinity,
                    child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        'You can now view\nYour medical history',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(1.0, 1.0),
                                              blurRadius: 20,
                                              color:
                                                  Color.fromARGB(100, 0, 0, 0),
                                            )
                                          ],
                                          color: Color(0XFF797EF6),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Sit back,\nWait until your token is called...',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(1.0, 1.0),
                                              blurRadius: 20,
                                              color:
                                                  Color.fromARGB(100, 0, 0, 0),
                                            )
                                          ],
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Expanded(
                              child: Image.asset(
                                "assets/image/heart.png",
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Token Status',
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
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 40),
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
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0XFF797EF6),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
