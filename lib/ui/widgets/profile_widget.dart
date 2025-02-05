import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  ProfileWidget({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Constants.blackColor.withOpacity(.4),
        size: 16,
      ),
      leading: Icon(
        icon,
        color: Constants.blackColor.withOpacity(.5),
        size: 24,
      ),
      title: Text(title),
      titleTextStyle: TextStyle(
        color: Constants.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}