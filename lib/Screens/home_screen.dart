import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:practice_1/BOXES_hiveDB/boxes.dart';
import 'package:practice_1/MODEL/notes.dart';
import 'package:practice_1/WIDGETS/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //TEXT FORM FIELD CONTROLLERS
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Database'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<NotesModel>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<NotesModel>();
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            data[index].title.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          const Spacer(),
                          InkWell(
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            onTap: () {
                              editNotes(
                                  context,
                                  titleController,
                                  descriptionController,
                                  data[index],
                                  data[index].title.toString(),
                                  data[index].description.toString());
                            },
                          ),
                          InkWell(
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onTap: () {
                              delete(data[index]);
                            },
                          ),
                        ],
                      ),
                      Text(
                        data[index].description.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 15),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showMyDialog(context, titleController, descriptionController);

          //This Code is only for Basics of Hive and Boxes
          // //create Box(files)
          // var box = await Hive.openBox('BoxOne');
          // //create 2nd Box
          // var box2 = await Hive.openBox('BoxTwo');
          // //putting data in above boxes
          // box.put('name', 'Fawad');
          // box2.put('name', 'HiveDB SQL');
          //
          // //Storing multiple Data
          // box.put('details', {
          //   'Profession': 'Software Eng',
          //   'Batch': '2019',
          // });
          // //ForPrinting box
          // print(box.get('details'));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
