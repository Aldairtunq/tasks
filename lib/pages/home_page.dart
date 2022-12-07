import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasks/ui/widgets/general/colors.dart';
import 'package:tasks/ui/widgets/general_widgets.dart';
import 'package:tasks/ui/widgets/textfield_search_widgets.dart';

class HomePage extends StatelessWidget {
  CollectionReference taskReference =
      FirebaseFirestore.instance.collection('task');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBrandSecondaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 22.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(4, 4),
                      ),
                    ]),
                color: Colors.white,
                child: SafeArea(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bienvenidop Aldair",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: kBrandPrimaryColor,
                          ),
                        ),
                        Text(
                          "Mis Tareas",
                          style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.w600,
                            color: kBrandPrimaryColor,
                          ),
                        ),
                        divider10(),
                        TextFliedSearchWidget(),
                      ]),
                ),
              ),
            ],
          ),
        )
        // body: StreamBuilder(
        //   stream: taskReference.snapshots(),
        //   builder: (BuildContext context, AsyncSnapshot snap) {
        //     if (snap.hasData) {
        //       QuerySnapshot collection = snap.data;
        //       List<QueryDocumentSnapshot> docs = collection.docs;
        //       List<Map<String, dynamic>> docsMap =
        //           docs.map((e) => e.data() as Map<String, dynamic>).toList();
        //       print(docsMap);
        //       return ListView.builder(
        //         itemCount: docsMap.length,
        //         itemBuilder: (BuildContext context, int index) {
        //           return ListTile(
        //             title: Text(docsMap[index]["title"]),
        //           );
        //         },
        //       );
        //     }
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   },
        // ),
        );
  }
}
