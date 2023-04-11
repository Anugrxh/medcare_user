import 'package:flutter/material.dart';
import 'package:medcare_user/ui/widgets/custom_card.dart';

import 'home_screen_sections/dashboard_section.dart';
import 'home_screen_sections/patients_section.dart';
import 'home_screen_sections/settings_section.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: const [
            DashboardSection(),
            PatientsSection(),
            SettingsSection(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onChange: (index) {
          tabController.animateTo(index);
        },
        selectedIndex: tabController.index,
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChange;
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 10,
      shadowColor: Colors.black87,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomNavBarButton(
              icon: Icons.dashboard_outlined,
              label: 'Dashboard',
              onPressed: () {
                onChange(0);
              },
              isSelected: selectedIndex == 0,
            ),
            CustomNavBarButton(
              icon: Icons.people_outline,
              label: 'Family',
              onPressed: () {
                onChange(1);
              },
              isSelected: selectedIndex == 1,
            ),
            CustomNavBarButton(
              icon: Icons.settings_outlined,
              label: 'Settings',
              onPressed: () {
                onChange(2);
              },
              isSelected: selectedIndex == 2,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNavBarButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() onPressed;
  final bool isSelected;
  const CustomNavBarButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue[50],
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.blue : Colors.black,
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: isSelected ? Colors.blue : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
