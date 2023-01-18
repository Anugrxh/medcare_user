import 'dart:ui';

import 'package:flutter/material.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return HistoryItem();
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: 10,
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInlineText(
                  label: 'Name : ',
                  text: 'Anugrah M V',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomInlineText(
                  label: 'Doctor :',
                  text: '',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomInlineText(
                  label: 'Department :',
                  text: '',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomInlineText(
                  label: 'Prescription :',
                  text: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomInlineText extends StatelessWidget {
  final String label, text;
  const CustomInlineText({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        text: label,
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
