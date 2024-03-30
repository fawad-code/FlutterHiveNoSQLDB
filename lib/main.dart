import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice_1/MODEL/notes.dart';
import 'package:practice_1/Screens/home_screen.dart';

void main() async {
  //1-Initialize Widget
  WidgetsFlutterBinding.ensureInitialized();

  //2-Create Directory
  var directory = await getApplicationDocumentsDirectory();

  //3-Show path of directory to Hive DB
  Hive.init(directory.path);

  //Register Generated Adapter class
  Hive.registerAdapter(NotesModelAdapter());

  //Open Box
  await Hive.openBox<NotesModel>('notes');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQL LITE OPERATIONS',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.deepPurpleAccent.shade100),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

