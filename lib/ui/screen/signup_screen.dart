import 'package:flutter/material.dart';
import 'package:medcare_user/ui/screen/home_screen.dart';
import 'package:medcare_user/ui/screen/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isObsecure = true;
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
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: ListView(
                shrinkWrap: true,
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
                          "New User",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(6.0, 6.0),
                                blurRadius: 10.0,
                                color: Color.fromARGB(150, 0, 0, 0),
                              )
                            ],
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
                    "Sign up",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(6.0, 6.0),
                          blurRadius: 10.0,
                          color: Color.fromARGB(150, 0, 0, 0),
                        )
                      ],
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Name";
                        }
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          labelText: 'Name',
                          suffixIcon: Icon(Icons.person_add_alt_1_outlined)),
                    ),

                    //TextField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30.0),
                    //     ),
                    //     contentPadding: EdgeInsets.symmetric(
                    //       horizontal: 20,
                    //       vertical: 15,
                    //     ),
                    //     filled: true,
                    //     hintStyle: TextStyle(color: Colors.grey[800]),
                    //     hintText: "Enter Your Username",
                    //     fillColor: Color(0xF9F7F7),
                    //     suffixIcon: Icon(
                    //       Icons.person_add_alt_1_outlined,
                    //     ),
                    //   ),
                    // ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length < 10) {
                          return "Enter Phone Number";
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: 'Phone',
                      ),
                    ),

                    //TextField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30.0),
                    //     ),
                    //     contentPadding: EdgeInsets.symmetric(
                    //       horizontal: 20,
                    //       vertical: 15,
                    //     ),
                    //     filled: true,
                    //     hintStyle: TextStyle(color: Colors.grey[800]),
                    //     hintText: "Enter Your Password",
                    //     fillColor: Color(0xF9F7F7),
                    //     suffixIcon: Icon(Icons.remove_red_eye),
                    //   ),
                    // ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length < 0) {
                          return "Enter Date of birth";
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: 'Date of birth',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length < 2) {
                          return "Enter Your Sex";
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: 'Sex',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length < 8) {
                          return "Enter password";
                        }
                      },
                      obscureText: _isObsecure,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isObsecure = !_isObsecure;
                            });
                          },
                          child: Icon(
                            _isObsecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),

                    //TextField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30.0),
                    //     ),
                    //     contentPadding: EdgeInsets.symmetric(
                    //       horizontal: 20,
                    //       vertical: 15,
                    //     ),
                    //     filled: true,
                    //     hintStyle: TextStyle(color: Colors.grey[800]),
                    //     hintText: "Enter Your Password",
                    //     fillColor: Color(0xF9F7F7),
                    //     suffixIcon: Icon(Icons.remove_red_eye),
                    //   ),
                    // ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length < 8) {
                          return "Enter password";
                        }
                      },
                      obscureText: _isObsecure,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: 'Confirm Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isObsecure = !_isObsecure;
                            });
                          },
                          child: Icon(
                            _isObsecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      }
                    },
                    child: Material(
                      color: Color(0xFF797EF6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        child: Text(
                          "SignUp",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
