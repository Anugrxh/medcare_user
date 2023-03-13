import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:medcare_user/ui/screen/home_screen.dart';

class ProfileScreeen extends StatefulWidget {
  const ProfileScreeen({super.key});

  @override
  State<ProfileScreeen> createState() => _ProfileScreeenState();
}

class _ProfileScreeenState extends State<ProfileScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/image/profile_person.png"),
            SizedBox(
              height: 10,
            ),
            Text(
              "PROFILE",
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Name : Anugrah',
                disabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
              enabled: false,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'User ID : 12858',
                disabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
              enabled: false,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Sex : Male',
                disabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
              enabled: false,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date Of Birth : 08/03/2002',
                disabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
              enabled: false,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Age : 20',
                disabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
              enabled: false,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Status : Active',
                disabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
