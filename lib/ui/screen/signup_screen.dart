import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcare_user/ui/widgets/custom_button.dart';
import 'package:medcare_user/ui/widgets/custom_card.dart';
import 'package:medcare_user/util/value_validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../blocs/auth/sign_up/sign_up_bloc.dart';
import '../widgets/custom_alert_dialog.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class Register extends StatefulWidget {
  final bool updateMode;
  final Map<String, dynamic>? userDetails;
  const Register({
    super.key,
    this.updateMode = false,
    this.userDetails,
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    if (widget.userDetails != null) {
      _nameController.text = widget.userDetails!['name'];
      _phoneNumberController.text = widget.userDetails!['phone_number'];
      _emailController.text =
          Supabase.instance.client.auth.currentUser!.email ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.updateMode
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              leading: const BackButton(
                color: Colors.black87,
              ),
              title: Text(
                'Update Profile',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                    ),
              ),
            )
          : null,
      body: BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(),
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpFailureState) {
              showDialog(
                context: context,
                builder: (context) => const CustomAlertDialog(
                  title: 'Failed',
                  message:
                      'Please check your email and password and try again.',
                  primaryButtonLabel: 'Ok',
                ),
              );
            } else if (state is SignUpSuccessState) {
              if (widget.updateMode) {
                Navigator.pop(context);
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                widget.updateMode
                    ? const SizedBox()
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(double.infinity, 200),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                widget.updateMode
                    ? const SizedBox(
                        height: 80,
                      )
                    : const SizedBox(),
                Text(
                  widget.updateMode ? 'Update Profile' : 'Welcome',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    widget.updateMode
                        ? 'Update the details and press save to apply them'
                        : 'Enter your email and password to Register a new account.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
                widget.updateMode
                    ? const SizedBox(
                        height: 40,
                      )
                    : const SizedBox(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          CustomCard(
                            child: TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                              ),
                              validator: alphanumericWithSpaceValidator,
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomCard(
                            child: TextFormField(
                              controller: _phoneNumberController,
                              decoration: const InputDecoration(
                                hintText: 'Phone Number',
                              ),
                              validator: phoneNumberValidator,
                            ),
                          ),
                          const SizedBox(height: 10),
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
                              obscureText: _isObscure,
                              controller: _passwordController,
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
                              validator: widget.updateMode
                                  ? (value) {
                                      return null;
                                    }
                                  : passwordValidator,
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomCard(
                            child: TextFormField(
                              obscureText: _isObscure,
                              controller: _confirmPasswordController,
                              decoration: const InputDecoration(
                                hintText: 'Confirm Password',
                              ),
                              validator: (value) {
                                if ((value == null || value.trim().isEmpty) &&
                                    !widget.updateMode) {
                                  return 'Please re-enter your password';
                                } else if (_passwordController.text.trim() !=
                                    _confirmPasswordController.text.trim()) {
                                  return 'Passwords doesnt match.';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            isLoading: state is SignUpLoadingState,
                            buttonColor: Colors.blue,
                            labelColor: Colors.white,
                            label: widget.updateMode ? 'Save' : 'Register',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (widget.updateMode) {
                                  BlocProvider.of<SignUpBloc>(context).add(
                                    UpdateUserEvent(
                                      name: _nameController.text.trim(),
                                      email: _emailController.text.trim(),
                                      phoneNumber:
                                          _phoneNumberController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    ),
                                  );
                                } else {
                                  BlocProvider.of<SignUpBloc>(context).add(
                                    CreateUserEvent(
                                      name: _nameController.text.trim(),
                                      email: _emailController.text.trim(),
                                      phoneNumber:
                                          _phoneNumberController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                          const SizedBox(height: 30),
                          widget.updateMode
                              ? const SizedBox()
                              : Text(
                                  'Already have an account?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                          widget.updateMode
                              ? const SizedBox()
                              : const SizedBox(height: 5),
                          widget.updateMode
                              ? const SizedBox()
                              : CustomButton(
                                  labelColor: Colors.blue,
                                  label: 'Login',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                          const SizedBox(height: 50),
                        ],
                      ),
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
