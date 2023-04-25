import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcare_user/blocs/auth/sign_in/sign_in_bloc.dart';
import 'package:medcare_user/ui/screen/home_screen.dart';
import 'package:medcare_user/ui/screen/signup_screen.dart';
import 'package:medcare_user/ui/widgets/custom_button.dart';
import 'package:medcare_user/ui/widgets/custom_card.dart';
import 'package:medcare_user/util/value_validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../widgets/custom_alert_dialog.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (Supabase.instance.client.auth.currentUser != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(),
        child: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInFailureState) {
              showDialog(
                context: context,
                builder: (context) => const CustomAlertDialog(
                  title: 'Failed',
                  message:
                      'Please check your email and password and try again.',
                  primaryButtonLabel: 'Ok',
                ),
              );
            } else if (state is SignInSuccessState) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }
          },
          builder: (context, state) {
            return ListView(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(double.infinity, 300),
                      painter: ArcPainter(),
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.medical_information_outlined,
                          color: Colors.white,
                          size: 50,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'MEDCARE',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Enter your email and password to login.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomCard(
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                            validator: emailValidator,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomCard(
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _isObscure = !_isObscure;
                                  setState(() {});
                                },
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          isLoading: state is SignInLoadingState,
                          buttonColor: Colors.blue,
                          labelColor: Colors.white,
                          label: 'Login',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String email = _emailController.text.trim();
                              String password = _passwordController.text.trim();

                              BlocProvider.of<SignInBloc>(context).add(
                                SignInEvent(
                                  email: email,
                                  password: password,
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Dont have an account?',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        CustomButton(
                          labelColor: Colors.blue,
                          label: 'Register',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Register(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.lightBlueAccent,
          Colors.blueAccent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..lineTo(0, size.height * 0.75)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height * 0.75)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawShadow(path, Colors.grey.withOpacity(0.4), 4.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
