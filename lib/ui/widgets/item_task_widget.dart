import 'package:flutter/material.dart';
import 'package:tasks/models/task_model.dart';
import 'package:tasks/services/my_service_firestore.dart';
import 'package:tasks/ui/widgets/general/colors.dart';
import 'package:tasks/ui/widgets/general_widgets.dart';
import 'package:tasks/ui/widgets/item_category_widget.dart';

class ItemTaskWidget extends StatelessWidget {
  TaskModel taskModel;

  ItemTaskWidget({required this.taskModel});

  MyServicesFirestore _myServicesFirestore =
      MyServicesFirestore(collection: "task");

  showFinishedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "finalizar tarea",
                style: TextStyle(
                  color: kBrandPrimaryColor.withOpacity(0.87),
                  fontWeight: FontWeight.w600,
                ),
              ),
              divider6(),
              Text(
                "deseas finalizar la tarea seleccionada",
                style: TextStyle(
                  color: kBrandPrimaryColor.withOpacity(0.87),
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                ),
              ),
              divider10(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "cancelar",
                      style: TextStyle(
                        color: kBrandPrimaryColor.withOpacity(0.87),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  divider10Width(),
                  ElevatedButton(
                    onPressed: () {
                      _myServicesFirestore.finishedTask(taskModel.id!);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: kBrandPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        )),
                    child: Text(
                      "Finalizar",
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(4, 4),
              blurRadius: 12.0,
            )
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemCategoryWidget(
                  text: taskModel.category,
                ),
                divider3(),
                Text(
                  taskModel.title,
                  style: TextStyle(
                    decoration: taskModel.status
                        ? TextDecoration.none
                        : TextDecoration.lineThrough,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: kBrandPrimaryColor.withOpacity(0.85),
                  ),
                ),
                Text(
                  taskModel.description,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: kBrandPrimaryColor.withOpacity(0.75),
                  ),
                ),
                divider6(),
                Text(
                  taskModel.date,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: kBrandPrimaryColor.withOpacity(0.75),
                  ),
                ),
              ],
            ),
            Positioned(
              top: -10,
              right: -12,
              child: PopupMenuButton(
                  elevation: 2,
                  color: Colors.white,
                  icon: Icon(
                    Icons.more_vert,
                    color: kBrandPrimaryColor.withOpacity(0.85),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  onSelected: (value) {
                    if (value == 1) {
                      //
                      showFinishedDialog(context);
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        value: "hola",
                        child: Text(
                          "Editar",
                          style: TextStyle(
                            fontSize: 13.0,
                            color: kBrandPrimaryColor.withOpacity(0.85),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: "hola2",
                        child: Text(
                          "finalizar",
                          style: TextStyle(
                            fontSize: 13.0,
                            color: kBrandPrimaryColor.withOpacity(0.85),
                          ),
                        ),
                      ),
                    ];
                  }),
            ),
          ],
        ));
  }
}
