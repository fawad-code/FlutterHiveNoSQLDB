import 'package:flutter/material.dart';
import 'package:practice_1/BOXES_hiveDB/boxes.dart';

import '../MODEL/notes.dart';

//Create Dialog BOX
Future<void> showMyDialog(BuildContext context, titleController, descriptionController) async {
  return showDialog(
      context: (context),
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          title: const Text('Add Notes'),
          actions: [
            TextButton(
              onPressed: () {
                final data = NotesModel(
                    title: titleController.text,
                    description: descriptionController.text);

                //getData ftn created in boxes file
                final box = Boxes.getData();
                //data will be get from NotesModel and stored in data
                box.add(data);

                //If we don't extend our model with HiveObject we can't save data like below
                data.save();

                // print(box);
                //clearing
                titleController.clear;
                descriptionController.clear;



                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      });
}