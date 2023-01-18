import 'package:flutter/material.dart';

class DashBoardCard extends StatelessWidget {
  final String label, imageUrl;
  final Function() onPressed;

  const DashBoardCard({
    Key? key,
    required this.label,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 170,
      child: Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 4,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Image.asset(
                  imageUrl,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                label,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      color: Color.fromARGB(100, 0, 0, 0),
                    )
                  ],
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
