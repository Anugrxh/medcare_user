import 'package:flutter/material.dart';
import 'package:medcare_user/ui/screen/current_booking.dart';
import 'package:medcare_user/ui/screen/history_screen.dart';
import 'package:medcare_user/ui/screen/login_screen.dart';
import 'package:medcare_user/ui/screen/profile_screen.dart';
import 'package:medcare_user/ui/screen/token_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  String label = 'Dashboard';

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      switch (tabController.index) {
        case 0:
          label = 'Dash Board';
          break;
        case 1:
          label = 'History';
          break;
        case 2:
          label = 'Token Status';
          break;
        case 3:
          label = 'Dash Board';
          break;
        default:
          label = 'Dash Board';
      }
      setState(() {});
    });
    super.initState();
  }

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
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 24, right: 18),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreeen()));
                  },
                  icon: Icon(
                    Icons.person_4_outlined,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
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
                                        'Conveniantly\nMeet Your Doctor',
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
                                          fontSize: 17,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'We Care for you\nWith the help of top class Doctor',
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
                                          fontSize: 12,
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
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      tabController.index > 0
                          ? GestureDetector(
                              onTap: () {
                                tabController.animateTo(0);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 18,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      Text(
                        label,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
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
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      DashboardSection(
                        onSelect: (index) {
                          tabController.animateTo(index);
                        },
                      ),
                      const HistorySection(),
                      const Token(),
                      const CurrentBokingScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardSection extends StatelessWidget {
  final Function(int) onSelect;
  const DashboardSection({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          DashBoardCard(
            imageUrl: "assets/image/history.png",
            label: "History",
            onPressed: () {
              onSelect(1);
            },
          ),
          DashBoardCard(
            imageUrl: "assets/image/token.png",
            label: "Token Status",
            onPressed: () {
              onSelect(2);
            },
          ),
          DashBoardCard(
            imageUrl: "assets/image/bookings.png",
            label: "Curreny Bookings",
            onPressed: () {
              onSelect(3);
            },
          ),
          DashBoardCard(
            imageUrl: "assets/image/logout.png",
            label: "Logout",
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => Dialog(
                        backgroundColor: Color(0xFF797EF6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Do you want to logout?",
                                style: TextStyle(
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 20,
                                      color: Color.fromARGB(100, 0, 0, 0),
                                    )
                                  ],
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login()));
                                    },
                                    child: Material(
                                      elevation: 10,
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 15),
                                        child: Center(
                                            child: Text(
                                          "Yes",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Material(
                                      elevation: 10,
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 15),
                                        child: Center(
                                            child: Text(
                                          "No",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
            },
          ),
        ],
      ),
    );
  }
}

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
