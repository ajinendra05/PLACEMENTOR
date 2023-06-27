import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Data/constantData.dart';
import '../Models/job_model.dart';
import '../Widgets/Offcampousdetails.dart';
import '../Widgets/job_widget.dart';
import '../backend/firbase_service.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  bool loaded = false;
  List<InternDetails>? interndetailsList;
  @override
  Widget build(BuildContext context) {
    final listProvider = Provider.of<ReadInternDetails>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
            title: Text(
                textWidthBasis: TextWidthBasis.parent,
                'Welcome,${FirebaseAuth.instance.currentUser!.displayName}',
                style: kpacifco.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: height * 0.025,
                    color: Colors.black)),
            backgroundColor: const Color.fromARGB(255, 242, 152, 84)),
        body: Container(
          child: StreamBuilder(
            stream: listProvider.fetchInternListAsStream(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {}
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              final InternDocoments = snapshot.data.docs;
              int length = snapshot.data.docs.length;
              interndetailsList = List.generate(
                length,
                ((index) {
                  return InternDetails(
                      firm: InternDocoments[index]['firm'],
                      jobD: InternDocoments[index]['jobD'],
                      skill: InternDocoments[index]['skill'],
                      img: InternDocoments[index]['img'],
                      category: InternDocoments[index]['cat'],
                      company: InternDocoments[index]['com'],
                      todayDaaate: DateTime.fromMillisecondsSinceEpoch(
                          InternDocoments[index]['date']
                              .microsecondsSinceEpoch),
                      package: InternDocoments[index]['pkg'],
                      isfavorite: InternDocoments[index]['fav'],
                      cloudID: InternDocoments[index].id);
                }),
                growable: true,
              );

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: height * 0.65,
                      child: ListView(
                        children: [
                          ...interndetailsList!.map((e) {
                            return InternDetail(data: e);
                          }).toList()
                        ],
                      ),
                    ),
                    Container(
                      width: 500,
                      color: Color.fromARGB(83, 180, 179, 179),
                      alignment: Alignment.center,
                      child: Text(
                          textWidthBasis: TextWidthBasis.parent,
                          'Off-Campus Opportunity',
                          style: kLora.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.03,
                              color: kcextra1)),
                    ),
                    Container(
                      color: Color.fromARGB(83, 180, 179, 179),
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      height: height * 0.21,
                      width: width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...interndetailsList!.map((e) {
                            return OffCampousDetail(data: e);
                          }).toList()
                        ],
                      ),
                    )
                  ]);
            },
          ),
        ));
  }
}
