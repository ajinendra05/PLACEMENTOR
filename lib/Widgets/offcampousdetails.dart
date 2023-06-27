import 'package:flutter/material.dart';
import '../Models/job_model.dart';

class OffCampousDetail extends StatelessWidget {
  final InternDetails data;

  const OffCampousDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(5),
            width: 40,
            height: 40,
            child: Image.asset(
              'assets/Images/lightbulb.png',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            data.category,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'LibreBaskerville',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            data.company,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ]),
      ),
    );
  }
}
