

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Image.asset("assets/image/bg.png",
             width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
            
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          shadows: <Shadow>[Shadow(offset: Offset(6.0, 6.0),
      blurRadius: 10.0,
      color: Color.fromARGB(150, 0, 0, 0),)],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),

                // ignore: prefer_const_constructors
                Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    shadows: <Shadow>[Shadow(offset: Offset(6.0, 6.0),
      blurRadius: 10.0,
      color: Color.fromARGB(150, 0, 0, 0),)],
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    
                  ),
                ),

                const SizedBox(
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15,),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Your Username",
                      fillColor: Color(0xF9F7F7),
                      suffixIcon: Icon(Icons.person_add_alt_1_outlined,),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15,),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Enter Your Password",
                        fillColor: Color(0xF9F7F7),
                        suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Material(
                  color: Color(0xFF797EF6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text("Forgot Password?")
                

              ],
            ),
          ],
        ),
      ),
    );
  }
}
