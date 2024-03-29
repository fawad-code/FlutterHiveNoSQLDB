import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Database'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
              //Provide Reference of created box (BoxOne is name of box we gave)
              future: Hive.openBox('BoxOne'),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListTile(
                        tileColor: Colors.orangeAccent,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        title: Text(
                          snapshot.data!.get('name').toString(),
                        ),
                        subtitle: Text(
                          snapshot.data!.get('age').toString(),
                        ),
                        //Editing Name means updating
                        trailing: IconButton(
                            onPressed: () {
                              snapshot.data!.put('name', 'Fawad');
                              //call set state to get changes
                              setState(() {
                              });
                            }, icon: const Icon(Icons.edit)),
                      ),
                    ),
                  ],
                );
              }),
          FutureBuilder(
              //Provide Reference of created box (BoxOne is name of box we gave)
              future: Hive.openBox('BoxTwo'),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListTile(
                          tileColor: Colors.blueGrey,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: Text(
                            snapshot.data!.get('name').toString(),
                          ),
                          subtitle: Text(
                            snapshot.data!.get('age').toString(),
                          ),
                        trailing: IconButton(
                            onPressed: () {
                              snapshot.data!.delete('name');
                              snapshot.data!.put('age', '20');
                              //call set state to get changes
                              setState(() {
                              });
                            }, icon: const Icon(Icons.delete)),),
                    ),
                  ],
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //create Box(files)
          var box = await Hive.openBox('BoxOne');
          //create 2nd Box
          var box2 = await Hive.openBox('BoxTwo');
          //putting data in above boxes
          box.put('name', 'Fawad');
          box2.put('name', 'HiveDB SQL');

          //Storing multiple Data
          box.put('details', {
            'Profession': 'Software Eng',
            'Batch': '2019',
          });
          //ForPrinting box
          print(box.get('details'));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
