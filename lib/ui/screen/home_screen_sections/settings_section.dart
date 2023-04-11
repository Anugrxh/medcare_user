import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcare_user/ui/screen/signup_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../blocs/auth/sign_up/sign_up_bloc.dart';
import '../../widgets/change_password.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/drawer_button.dart';
import '../login_screen.dart';

class SettingsSection extends StatefulWidget {
  const SettingsSection({super.key});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  SignUpBloc signUpBloc = SignUpBloc();

  @override
  void initState() {
    super.initState();
    signUpBloc.add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 20),
          BlocProvider<SignUpBloc>.value(
            value: signUpBloc,
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                if (state is SignUpSuccessState) {
                  return DrawerButton(
                    iconData: Icons.person_outline,
                    label: 'UPDATE PROFILE',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Register(
                            updateMode: true,
                            userDetails: state.userDetails,
                          ),
                        ),
                      );
                    },
                    isSelected: false,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DrawerButton(
            iconData: Icons.lock_outline,
            label: 'CHANGE PASSWORD',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const ChangePasswordDialog(),
              );
            },
            isSelected: false,
          ),
          const SizedBox(
            height: 10,
          ),
          DrawerButton(
            iconData: Icons.logout_outlined,
            label: 'LOGOUT',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Logout',
                  message: 'Are you sure you want to logout?',
                  primaryButtonLabel: 'Logout',
                  primaryOnPressed: () async {
                    await Supabase.instance.client.auth.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  secondaryButtonLabel: 'Cancel',
                ),
              );
            },
            isSelected: false,
          ),
        ],
      ),
    );
  }
}
