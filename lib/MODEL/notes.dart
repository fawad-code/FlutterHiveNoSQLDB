
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'notes.g.dart';

//Type Id is Model Class ID for another class we have to use typeId: new
@HiveType(typeId: 0)

//extend it with Hive Object to save Data
class NotesModel extends HiveObject {

  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  //constructors
  NotesModel({required this.title, required this.description});

}