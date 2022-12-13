import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tasks/models/task_model.dart';
import 'package:tasks/services/my_service_firestore.dart';
import 'package:tasks/ui/widgets/button_normal_widget.dart';
import 'package:tasks/ui/widgets/general/colors.dart';
import 'package:tasks/ui/widgets/general_widgets.dart';
import 'package:tasks/ui/widgets/textfield_Normal_widgets.dart';

class TaskFormWidget extends StatefulWidget {
  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  final formkey = GlobalKey<FormState>();
  MyServicesFirestore taskService = MyServicesFirestore(collection: "tasks");
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String categorySelect = "Personal";

  showSelectDate() async {
    DateTime? datetime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2020),
        cancelText: "Cancelar",
        confirmText: "aceptar",
        helpText: "seeleccionar fecha",
        builder: (BuildContext context, Widget? widget) {
          return Theme(
            data: ThemeData.light().copyWith(
                dialogBackgroundColor: Colors.white,
                dialogTheme: DialogTheme(
                    elevation: 0,
                    backgroundColor: kBrandSecondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                colorScheme: ColorScheme.light(
                  primary: kBrandPrimaryColor,
                )),
            child: widget!,
          );
        });
    if (datetime != null) {
      _dateController.text = datetime.toString().substring(0, 10);
      setState(() {});
    }
  }

  registerTask() {
    if (formkey.currentState!.validate()) {
      //
      TaskModel taskmodel = TaskModel(
        title: _titleController.text,
        description: _titleController.text,
        date: _dateController.text,
        category: categorySelect,
        status: true,
      );
      taskService.addTask(taskmodel).then((value) {
        if (value.isNotEmpty) {
          //
          Navigator.pop(context);
          showSnackBarSuccess(context, "la tarea fue registrada con exito.");
        }
      }).catchError((error) {
        //
        showSnackBarError(context, "hubo un incombienente intentalo de nuevo");
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26.0), topRight: Radius.circular(22.0))),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "agregar tarea",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.0,
              ),
            ),
            divider10(),
            TextFliedNormalWidget(
              hintText: "titulo",
              icon: Icons.text_fields,
              controller: _titleController,
            ),
            divider10(),
            TextFliedNormalWidget(
              hintText: "description",
              icon: Icons.description,
              controller: _descriptionController,
            ),
            divider10(),
            const Text("Categorias: "),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              spacing: 10.0,
              children: [
                FilterChip(
                  selected: categorySelect == "Personal",
                  backgroundColor: kBrandSecondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  selectedColor: categoryColor[categorySelect],
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                      color: categorySelect == "Personal"
                          ? Colors.white
                          : kBrandPrimaryColor),
                  label: Text("Personal"),
                  onSelected: (bool value) {
                    categorySelect = "Personal";
                    setState(() {});
                  },
                ),
                FilterChip(
                  selected: categorySelect == "Trabajo",
                  backgroundColor: kBrandSecondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  selectedColor: categoryColor[categorySelect],
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                      color: categorySelect == "Trabajo"
                          ? Colors.white
                          : kBrandPrimaryColor),
                  label: Text("Trabajo"),
                  onSelected: (bool value) {
                    categorySelect = "Trabajo";
                    setState(() {});
                  },
                ),
                FilterChip(
                  selected: categorySelect == "Otro",
                  backgroundColor: kBrandSecondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  selectedColor: categoryColor[categorySelect],
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                      color: categorySelect == "Otro"
                          ? Colors.white
                          : kBrandPrimaryColor),
                  label: Text("Otro"),
                  onSelected: (bool value) {
                    categorySelect = "Otro";
                    setState(() {});
                  },
                ),
              ],
            ),
            divider10(),
            TextFliedNormalWidget(
              hintText: "Fecha",
              icon: Icons.date_range,
              onTap: () {
                showSelectDate();
              },
              controller: _dateController,
            ),
            divider20(),
            ButtonNormalWidget(onPressed: () {
              registerTask();
            }),
          ],
        ),
      ),
    );
  }
}
