import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
          DrawerButton(
            iconData: Icons.person_outline,
            label: 'UPDATE PROFILE',
            onPressed: () {},
            isSelected: false,
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
