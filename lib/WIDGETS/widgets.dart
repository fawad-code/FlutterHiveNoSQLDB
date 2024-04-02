import 'package:flutter/material.dart';
import 'package:practice_1/BOXES_hiveDB/boxes.dart';
import '../MODEL/notes.dart';


//DELETE DATA FTN
void delete (NotesModel notesModel) async {
  await notesModel.delete();
}

//EDIT DATA FTN
Future<void> editNotes(BuildContext context, titleController, descriptionController, NotesModel notesModel, String title, String description) async {

  titleController.text = title;
  descriptionController.text = description;

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
                    hintText: 'Edit Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Edit Description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          title: const Text('Edit Notes'),
          actions: [
            TextButton(
              onPressed: () {
                notesModel.title = titleController.text.toString();
                notesModel.save();
                notesModel.description = descriptionController.text.toString();
                notesModel.save();
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      });
}



//Create Dialog BOX for Displaying Dialog on UI
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
          ],
        );
      });
}