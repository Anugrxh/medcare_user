import 'package:flutter/material.dart';

import '../../widgets/custom_card.dart';
import '../login_screen.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            padding: const EdgeInsets.only(
              top: 250,
              left: 20,
              right: 20,
            ),
            children: [
              Text(
                'Todays Tokens',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    height: 200,
                    color: Colors.red,
                  )
                ],
              ),
            ],
          ),
          CustomPaint(
            size: const Size(double.infinity, 250),
            painter: ArcPainter(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 10,
              top: 50,
            ),
            child: SizedBox(
              width: double.infinity,
              child: CustomCard(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 20,
                        bottom: 15,
                        right: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Conveniantly\nMeet Your Doctor',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 20,
                                  color: Color.fromARGB(100, 0, 0, 0),
                                )
                              ],
                              color: Color(0XFF797EF6),
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'We Care for you\nWith the help of top class Doctors',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 20,
                                  color: Color.fromARGB(100, 0, 0, 0),
                                )
                              ],
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/image/heart.png",
                    width: 100,
                    fit: BoxFit.cover,
                  )
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
