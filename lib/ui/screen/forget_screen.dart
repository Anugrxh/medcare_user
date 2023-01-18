import 'package:flutter/material.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 31, 45),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                width: w,
                height: h * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      filterQuality: FilterQuality.high,
                      image: AssetImage("images/staylit.png"),
                      fit: BoxFit.contain),
                ),
              ),
              SizedBox(height: 70),
              Container(
                width: w,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forget Password?",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Enter the email associated with your account and we will sent an email with instructionn to reset your password",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "  Email",
                        prefixIcon: Icon(Icons.mail),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      'Email has been sent successfully',
                      style: TextStyle(fontSize: 15),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}