import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/job_model.dart';
import '../Screen/jobDescription.dart';

class InternDetail extends StatefulWidget {
  const InternDetail({super.key, required this.data});
  final InternDetails data;

  @override
  State<InternDetail> createState() => _InternDetailState();
}

class _InternDetailState extends State<InternDetail> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final avlW = mq.size.width;
    final avlH = mq.size.height;
    return Container(
      height: avlH * 0.12,
      width: avlW,
      child: LayoutBuilder(
        builder: (ctx, constrain) {
          final F_CMW = constrain.maxWidth;
          final F_CMH = constrain.maxHeight;
          return GestureDetector(
              onTap: () {
                // Within the `FirstRoute` widget

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JobDescription(
                            data: widget.data,
                          )),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: EdgeInsets.fromLTRB(
                    F_CMW * 0.03, F_CMH * 0.07, F_CMW * 0.03, F_CMH * 0.07),
                elevation: 2,
                shadowColor: const Color.fromARGB(255, 129, 129, 127),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(F_CMW * 0.02,
                              F_CMH * 0.03, F_CMW * 0.02, F_CMH * 0.03),
                          height: F_CMH * 0.6,
                          width: F_CMW * 0.2,
                          // height: 70,
                          child: Image.asset(
                            'assets/Images/jobS1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.fromLTRB(F_CMW * 0.01, 0, 0, 0),
                              width: F_CMW * 0.6,
                              height: F_CMH * 0.3,
                              child: Text(
                                widget.data.category,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Oswald',
                                    fontSize: F_CMH * 0.2,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              width: F_CMW * 0.6,
                              margin:
                                  EdgeInsets.fromLTRB(F_CMW * 0.01, 0, 0, 0),
                              child: Text(
                                widget.data.company,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'Oswald',
                                    fontSize: F_CMH * 0.13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: F_CMW * 0.3,
                            height: F_CMH * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: F_CMW * 0.2,
                                  child: Text(
                                    '${widget.data.package} LPA',
                                    style: TextStyle(fontSize: F_CMH * 0.1),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
