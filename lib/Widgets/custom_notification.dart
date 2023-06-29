import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:placementor/Data/constantData.dart';

import 'customButton.dart';

class CustomFollowNotifcation extends StatefulWidget {
  const CustomFollowNotifcation({Key? key}) : super(key: key);

  @override
  State<CustomFollowNotifcation> createState() =>
      _CustomFollowNotifcationState();
}

class _CustomFollowNotifcationState extends State<CustomFollowNotifcation> {
  bool follow = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
          color: kcextra5.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/Images/jobS2.png"),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Microsoft",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Oswald',
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              Text(
                "Assesment Test Today  .  h1",
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'Oswald',
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ],
            // ),
            // Expanded(
            //   child: Padding(
            //     padding: EdgeInsets.only(left: follow == false ? 50 : 30),
            //     child: CustomButton(
            //       height: 40,
            //       color: follow == false
            //           ? const Color.fromARGB(255, 242, 152, 84)
            //           : kcextra10,
            //       textColor: follow == false ? Colors.white : Colors.black,
            //       onTap: () {
            //         setState(() {
            //           follow = !follow;
            //         });
            //       },
            //       text: "Follow",
            //     ),
            //   ),
          )
        ],
      ),
    );
  }
}
