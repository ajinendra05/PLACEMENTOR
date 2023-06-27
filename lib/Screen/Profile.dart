import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:placementor/Screen/raiseaticket.dart';
import 'package:placementor/Screen/tandpcontact.dart';
import 'package:placementor/Screen/todo.dart';

import '../Data/constantData.dart';
import '../Widgets/profile_content_widget.dart';

class MyProfile extends StatefulWidget {
  static const routeName = '/MyProfile';
  MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isDark = false;

  // Function changeTheem;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var _uname;
    var _enroll;
    var _mobileNu;

    FirebaseFirestore.instance
        .collection('userDetails')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        // print(user!.uid + "12");
        if (element.id == user?.uid) {
          _uname = element.get('name');
          _enroll = element.get('enroll');
          _mobileNu = element.get('mobile_nu');
        }
      });
    });

    final appbar = AppBar(
        title: Text(
            textWidthBasis: TextWidthBasis.parent,
            'Profile',
            style: kpacifco.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: MediaQuery.of(context).size.height * 0.025,
                color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 242, 152, 84));

    final mq = MediaQuery.of(context);
    final avlH =
        mq.size.height - appbar.preferredSize.height - mq.padding.top - 55;
    return Scaffold(
        appBar: appbar,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('userDetails')
                .snapshots(),
            builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.data == null) return CircularProgressIndicator();
              final userDocoments = snapshot.data.docs;
              final userId = FirebaseAuth.instance.currentUser?.uid;
              // print("$_uname username");
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 7,
                    shadowColor: const Color.fromARGB(255, 129, 129, 127),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/Images/man.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              _uname,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                            Text(
                              _enroll,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Merriweather',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ToDoList(),
                          ));
                    },
                    child: const ProfileContent(
                      contentIcon: Icons.add_card_outlined,
                      contentTitle: 'To-Do',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TandP(),
                          ));
                    },
                    child: const ProfileContent(
                      contentIcon: Icons.contact_page_outlined,
                      contentTitle: 'T&P Cordinator',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => raiseATicket(),
                          ));
                    },
                    child: const ProfileContent(
                      contentIcon: Icons.message_outlined,
                      contentTitle: 'Raise a Ticket',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (_) => MyLogin(),
                        // ));
                        FirebaseAuth.instance.signOut();
                      },
                      child: const ProfileContent(
                        contentIcon: Icons.logout_outlined,
                        contentTitle: 'Log Out',
                      )),
                ],
              );
            }));
  }
}







//  SizedBox(
//                     height: 50,
//                   ),
//                   Card(
//                     elevation: 10,
//                     margin: EdgeInsets.all(5),
//                     child: Container(
//                       height: 50,
//                       width: 150,
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Profile',
//                         style: TextStyle(fontSize: 30, fontFamily: 'Pacifico'),
//                       ),
//                     ),
//                   ),