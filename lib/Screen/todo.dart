import 'package:flutter/material.dart';

import '../Data/constantData.dart';
import '../Widgets/todolistchild.dart';
import '../widgets/todoinput.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List todo = ["Search For Softwear Job"];

  void addTransection(String title, DateTime date) {
    setState(() {
      if (title.isEmpty) return;

      todo.add(title);
    });
  }

  void openTransectionInputBar(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: ((bctx) {
        return GestureDetector(
          child: TransectionInput(addTransection),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
        title: Text(
            textWidthBasis: TextWidthBasis.parent,
            'DOCKET',
            style: kpacifco.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: MediaQuery.of(context).size.height * 0.025,
                color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 242, 152, 84));

    final mq = MediaQuery.of(context);
    final avlH = mq.size.height - appbar.preferredSize.height - mq.padding.top;
    return Scaffold(
      appBar: appbar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment,
        children: [
          //   SizedBox(
          //     height: 50,
          //   ),
          //   Container(
          //     width: double.maxFinite,
          //     alignment: Alignment.center,
          //     // child: Card(
          //     //   elevation: 10,
          //     //   margin: EdgeInsets.all(5),
          //     //   child: Container(
          //     //     height: 45,
          //     //     width: 230,
          //     // alignment: Alignment.center,
          //     child: Text(
          //       'DOCKET',
          //       style: TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
          //     ),
          //   ),
          // ),
          // ),
          Container(
            width: double.infinity,
            height: avlH,
            child: Column(
              children: [
                SizedBox(
                  height: avlH * 0.8,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoListChild(title: todo[index]);
                    },
                    itemCount: todo.length,
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: kcextra9.withOpacity(0.6),
                  elevation: 8,
                  onPressed: () {
                    openTransectionInputBar(context);
                  },
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
