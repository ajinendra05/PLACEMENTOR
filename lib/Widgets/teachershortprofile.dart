import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:placementor/Data/constantData.dart';

import '../Models/teacherdetails.dart';

class TeacherShortProfile extends StatelessWidget {
  TeacherShortProfile({super.key, required this.teacher});
  final TeacherDetails teacher;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 180,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: 50,
              height: 50,
              child: Image.asset(
                'assets/Images/user.png',
                fit: BoxFit.cover,
              ),
            ),
            Text(
              teacher.name,
              style: kPtSerif.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.start,
            ),
            Text(
              teacher.dprt,
              style: kPtSerif.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.start,
            ),
            Text(
              teacher.mobile_no,
              style: kPtSerif.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.start,
            ),
            Text(
              teacher.email,
              style: kPtSerif.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.start,
            ),
          ]),
        ));
  }
}
