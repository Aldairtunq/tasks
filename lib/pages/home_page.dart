import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference taskReference =
      FirebaseFirestore.instance.collection('task');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Firestore"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                taskReference.get().then((QuerySnapshot value) {
                  // QuerySnapshot collection = value;
                  // List<QueryDocumentSnapshot> docs = collection.docs;
                  // QueryDocumentSnapshot doc = docs[1];
                  // print(doc.id);
                  // print(doc.data());

                  QuerySnapshot collection = value;
                  collection.docs.forEach((QueryDocumentSnapshot element) {
                    Map<String, dynamic> myMap =
                        element.data() as Map<String, dynamic>;
                    print(myMap["title"]);
                  });
                });
              },
              child: Text(
                "obtener la data ",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                taskReference.add(
                  {
                    "title": "ir de compras al super3",
                    "description": "debemos comprar comida para todo el mes",
                  },
                ).then((DocumentReference value) {
                  print(value.id);
                }).catchError((error) {
                  print("ocurio un error en el registro");
                }).whenComplete(() {
                  print("el registro a terminado");
                });
              },
              child: Text(
                "Agregar DOCUMENTO ",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                taskReference.doc("zd29P17BQJlpAwNeVDlt").update(
                  {
                    "title": "ir de paseo",
                    "description": "tenemos que salir temprano",
                  },
                ).catchError(
                  (error) {
                    print(error);
                  },
                ).whenComplete(
                  () {
                    print("actualizacion terminada");
                  },
                );
              },
              child: Text(
                "Actualizar documento",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                taskReference.doc("zd29P17BQJlpAwNeVDlt").delete().catchError(
                  (error) {
                    print(error);
                  },
                ).whenComplete(
                  () {
                    print(" la eliminacion esta completada");
                  },
                );
              },
              child: Text(
                "Eliminar documento",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  taskReference.doc("A00002").set(
                    {
                      "title": "ir al concierto",
                      "description":
                          "este fin de semana tenemos que ir al concierto"
                    },
                  ).catchError((error) {
                    print(error);
                  }).whenComplete(
                    () {
                      print("creacion completada");
                    },
                  );
                },
                child: Text("Agregar documento personalizado"))
          ],
        ),
      ),
    );
  }
}
